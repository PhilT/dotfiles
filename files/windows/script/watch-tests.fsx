#load "watch.fsx"

open System.Diagnostics

let TIMEOUT = 60000

let runTests (changes: string list) =
  changes
  |> List.distinct
  |> List.iter(fun change ->
    let c = change.Split("|")
    Watcher.log $"Running interactive...{c.[0]}:{c.[1]}"
    Watcher.cmd "dotnet" $"fsi {c.[1]}"
  )


let agent =
  MailboxProcessor.Start(fun inbox ->
    let rec loop changes =
      async {
        let! msg =
          let timeout = if (List.isEmpty changes) then TIMEOUT else 200
          inbox.TryReceive(timeout)
        match msg with
        | Some m -> return! loop (m :: changes)
        | None ->
          if not (List.isEmpty changes) then runTests changes
          return! loop List.empty
        return! loop List.empty
      }

    loop List.empty
  )

Watcher.start agent @"\.(fs|fsx)$"
