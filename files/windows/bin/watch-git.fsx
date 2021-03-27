#load "watch.fsx"

let COMMIT_TIMEOUT = 10000 // Commit any changes after 10 seconds of no activity

let git (args: string) =
  Watcher.log $"git {args}"
  Watcher.cmd "git" args


let runGit changes =
  let changes = List.distinct changes |> String.concat ", "
  git "add ."
  git $"commit -m \"{changes}\""
  git "push"


let agent =
  MailboxProcessor.Start(fun inbox ->
    let rec loop changes =
      async {
        let! msg = inbox.TryReceive(COMMIT_TIMEOUT)
        match msg with
        | Some m -> return! loop(m :: changes)
        | None ->
          if not (List.isEmpty changes) then runGit changes
          return! loop List.empty
        return! loop List.empty
      }

    loop List.empty
  )

Watcher.start agent
