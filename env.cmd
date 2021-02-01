@echo off
rem Directory where non-installer based programs are installed
rem Non-chocolatey packages should be extracted to C:\tools
setx ChocolateyToolsLocation "C:\apps"

setx HOME "%USERPROFILE%"
setx XDG_CONFIG_HOME "%USERPROFILE%\.config"

setx TERM xterm-256color

rem Don't send data to Microsoft
setx DOTNET_CLI_TELEMETRY_OPTOUT true

rem FZF
setx FZF_DEFAULT_COMMAND "rg --files --no-ignore-vcs --hidden"

rem code/ folder dependent on OS
setx CODE_DIR D:\code

rem todo/ folder
setx TODO_DIR D:\todo


call RefreshEnv
