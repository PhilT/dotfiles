@echo off

setx DATA_DRIVE "D:"

rem Directory where non-installer based programs are installed
rem Non-chocolatey packages should be extracted to C:\tools
setx ChocolateyToolsLocation "%DATA_DRIVE%\apps"

setx HOME "%USERPROFILE%"
setx XDG_CONFIG_HOME "%USERPROFILE%\.config"

setx TERM xterm-256color

rem Don't send data to Microsoft
setx DOTNET_CLI_TELEMETRY_OPTOUT true

rem FZF
setx FZF_DEFAULT_COMMAND "rg --files --no-ignore-vcs --hidden --ignore-file %USERPROFILE%.ignore"

rem code/ folder dependent on OS
setx CODE_DIR "%DATA_DRIVE%\code"

rem txt/ folder
setx TXT_DIR "%DATA_DRIVE%\txt"

rem Path
rem System Path is searched before User Path so in order to control precedence
rem we'll ignore User Path and just use System Path

rem Delete User PATH environment variable
rem REG delete HKCU\Environment /F /V PATH

rem System Path
rem setx /m PATH "%USERPROFILE%\script;C:\apps\ruby30\bin;C:\Python39\Scripts\;C:\Python39\;C:\Python27\;C:\Python27\Scripts;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\ProgramData\chocolatey\bin;C:\Program Files\Calibre2\;C:\Program Files\dotnet\;C:\Program Files\Git\cmd;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files (x86)\Windows Kits\8.1\Windows Performance Toolkit\;C:\Program Files\Docker\Docker\resources\bin;C:\ProgramData\DockerDesktop\version-bin;C:\Program Files\nodejs\;C:\Program Files (x86)\dotnet\;C:\Users\phil\AppData\Local\Microsoft\WindowsApps;C:\Users\phil\.dotnet\tools;%DATA_DRIVE%\apps\neovim\Neovim\bin;C:\Users\phil\AppData\Roaming\npm"

call RefreshEnv
