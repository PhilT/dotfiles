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


let changed action (agent: MailboxProcessor<string>) sender (e: FileSystemEventArgs) =
  if not (Regex.IsMatch(e.FullPath, "(.git|bin\\\|obj\\\)")) then
    agent.Post($"{action} {e.Name}")


let rec loop () =
  printfn "Press q and ENTER to exit"

  let str = Console.ReadLine()
  if str <> "q" then loop ()


let start agent =
  watcher.Changed.AddHandler (FileSystemEventHandler(changed "Changed" agent))
  watcher.Created.AddHandler (FileSystemEventHandler(changed "Created" agent))
  watcher.Renamed.AddHandler (RenamedEventHandler(changed "Moved" agent))
  watcher.Deleted.AddHandler (FileSystemEventHandler(changed "Deleted" agent))

  watcher.Filter <- "*.*"
  watcher.IncludeSubdirectories <- true
  watcher.EnableRaisingEvents <- true

  loop ()
