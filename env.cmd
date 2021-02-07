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
setx FZF_DEFAULT_COMMAND "rg --files --no-ignore-vcs --hidden --ignore-file %USERPROFILE%.ignore"

rem code/ folder dependent on OS
setx CODE_DIR D:\code

rem todo/ folder
setx TODO_DIR D:\todo

rem Path
rem System Path is searched before User Path so in order to control precedence
rem we'll ignore User Path and just use System Path

rem Delete User PATH environment variable
REG delete HKCU\Environment /F /V PATH

rem System Path
setx /m PATH "%USERPROFILE%\bin;C:\Program Files\Alacritty\;C:\apps\ruby30\bin;C:\Python39\Scripts\;C:\Python39\;C:\Python27\;C:\Python27\Scripts;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\ProgramData\chocolatey\bin;C:\Program Files\Calibre2\;C:\Program Files\dotnet\;C:\Program Files\Git\cmd;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files (x86)\Windows Kits\8.1\Windows Performance Toolkit\;C:\Program Files\Docker\Docker\resources\bin;C:\ProgramData\DockerDesktop\version-bin;C:\Program Files\nodejs\;C:\Program Files (x86)\dotnet\;C:\Users\phil\AppData\Local\Microsoft\WindowsApps;C:\Users\phil\.dotnet\tools;C:\apps\neovim\Neovim\bin;C:\Users\phil\AppData\Roaming\npm"

call RefreshEnv
