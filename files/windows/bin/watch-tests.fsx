#load "watch.fsx"

open System.Diagnostics

let TIMEOUT = 60000

let runTests () =
  Watcher.log "Running tests..."
  Watcher.cmd "dotnet" "fsi fest_test.fsx"


let agent =
  MailboxProcessor.Start(fun inbox ->
    let rec loop timeout =
      async {
        let! msg = inbox.TryReceive(timeout)
        match msg with
        | Some m -> return! loop 200
        | None ->
          if timeout = 200 then runTests ()
          return! loop TIMEOUT
        return! loop timeout
      }

    loop TIMEOUT
  )

Watcher.start agent
