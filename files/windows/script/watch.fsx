module Watcher

open System
open System.IO
open System.Diagnostics
open System.Text.RegularExpressions

let EXE_TIMEOUT = 5000

let watcher = new FileSystemWatcher(Directory.GetCurrentDirectory())

let log (msg: string) =
  Console.ForegroundColor <- ConsoleColor.DarkGray
  printfn "%s" msg
  Console.ResetColor()


let cmd (cmd: string) (args: string) =
  let proc = Process.Start(cmd, args)
  proc.WaitForExit(EXE_TIMEOUT) |> ignore


let changed action (agent: MailboxProcessor<string>) includes sender (e: FileSystemEventArgs) =
  let isGitPath = Regex.IsMatch(e.FullPath, @"\.git")
  if ((Regex.IsMatch(e.FullPath, includes)) && not isGitPath) then
    agent.Post($"{action}|{e.Name}")


let rec loop () =
  printfn "Press q and ENTER to exit"

  let str = Console.ReadLine()
  if str <> "q" then loop ()


let start agent includes =
  watcher.Changed.AddHandler (FileSystemEventHandler(changed "Changed" agent includes))
  watcher.Created.AddHandler (FileSystemEventHandler(changed "Created" agent includes))
  watcher.Renamed.AddHandler (RenamedEventHandler(changed "Moved" agent includes))
  watcher.Deleted.AddHandler (FileSystemEventHandler(changed "Deleted" agent includes))

  watcher.IncludeSubdirectories <- true
  watcher.EnableRaisingEvents <- true

  loop ()
