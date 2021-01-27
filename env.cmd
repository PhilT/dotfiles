@echo off
rem Directory where non-installer based programs are installed
rem Non-chocolatey packages should be extracted to C:\tools
setx ChocolateyToolsLocation "C:\apps"

setx HOME "%USERPROFILE%"
setx XDG_CONFIG_HOME "%USERPROFILE%\.config"
RefreshEnv

setx TERM xterm-256color

rem Don't send data to Microsoft
setx DOTNET_CLI_TELEMETRY_OPTOUT true

rem FZF
setx FZF_DEFAULT_COMMAND "rg --files --no-ignore-vcs --hidden"

