@echo off

echo Install apps and configure Windows 10
echo -----------------------------------------
echo This script needs to Run As Administrator
echo.
echo Turn on Virtualization in the BIOS.
echo.
echo Press a key to start
pause

rem Setup Env vars
rem Format for env.cmd
rem @ECHO OFF
rem SETX <key> <value>
rem SETX <key> <value>
call .\env.cmd

mkdir %ChocolateyToolsLocation%
mkdir C:\tools

rem install chocolatey
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex (new-object net.webclient).downloadstring('https://chocolatey.org/install.ps1')"

rem Remove some built-in apps
powershell -NoProfile -Command "Get-AppxPackage Microsoft.YourPhone -AllUsers | Remove-AppxPackage"
powershell -NoProfile -Command "Get-AppxPackage *officehub* | Remove-AppxPackage"
powershell -NoProfile -Command "Get-AppxPackage *zunemusic* | Remove-AppxPackage"
powershell -NoProfile -Command "Get-AppxPackage *onenote* | Remove-AppxPackage"
powershell -NoProfile -Command "Get-AppxPackage *people* | Remove-AppxPackage"
powershell -NoProfile -Command ""
powershell -NoProfile -Command ""
powershell -NoProfile -Command ""

%ALLUSERSPROFILE%\chocolatey\bin\choco feature enable --name=allowGlobalConfirmation
call RefreshEnv

echo About to install apps from Chocolatey. Continue?
pause

%ALLUSERSPROFILE%\chocolatey\bin\choco feature enable --name=allowGlobalConfirmation
RefreshEnv

choco install^
 7zip^
 audacity-lame^
 audacity^
 autoit^
 blender^
 brave^
 calibre^
 cmake^
 discord^
 docker-desktop^
 dotnetcore-sdk^
 foobar2000^
 fraps^
 garmin-express^
 gimp^
 git^
 idrive^
 inkscape^
 keepass^
 libreoffice-fresh^
 microsoft-windows-terminal^
 nodejs^
 nvidia-display-driver^
 python2^
 python^
 ruby^
 slack^
 spotify^
 steam^
 sumatrapdf^
 synctrayzor^
 telegram^
 treesizefree^
 vlc^
 wsl-ubuntu-2004^
 xnview^
 zeal^
 zoom^

rem nordvpn

RefreshEnv

rem --- Benchmarks ---
choco install superposition-benchmark heaven-benchmark valley-benchmark

rem --- Install Latest Powershell --
dotnet tool install -g powershell

rem --- Install Neovim nightly and VimPlug
choco install neovim --pre
powershell "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni \"$env:LOCALAPPDATA/nvim-data/site/autoload/plug.vim\" -Force"

rem --- Install the neovim language integrations

rem Python 3
choco install visualcppbuildtools
py -m pip install --upgrade pip
py -m pip install neovim

rem Python 2
python -m pip install --upgrade pip
python -m pip install neovim

rem Ruby
gem install neovim

rem Node
npm -g install neovim

rem ------------------------------------------------

echo *** Apps to install (not in Chocolatey repo) ***
echo Reason
echo CrewChief
echo Ledger Live
echo MediaHuman YouTube MP3 Converter
echo Netflix
echo Razer Synapse
echo SysGauge
echo Unigine SDK


call RefreshEnv


mklink /D %USERPROFILE%\.config\nvim\after d:\code\dotfiles\files\config\nvim\after
mklink %USERPROFILE%\.config\nvim\init.vim d:\code\dotfiles\files\config\nvim\init.vim
mklink %USERPROFILE%\.gitconfig d:\code\dotfiles\files\gitconfig
mklink %USERPROFILE%\.gitignore d:\code\dotfiles\files\gitignore
mklink %USERPROFILE%\.ignore d:\code\dotfiles\files\ignore

rem Update man help
powershell -command "Update-Help -Force -ErrorAction SilentlyContinue"
