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

%ALLUSERSPROFILE%\chocolatey\bin\choco feature enable --name=allowGlobalConfirmation
call RefreshEnv

call remove_default_apps.cmd
call install_apps.cmd

rem --- Benchmarks ---
choco install superposition-benchmark heaven-benchmark valley-benchmark

rem -- Install Apps ---
call manual_install_apps.cmd

rem --- Install Neovim and integrations ---
call install_neovim.cmd
call RefreshEnv
call create_links.cmd

rem Update man help
powershell -command "Update-Help -Force -ErrorAction SilentlyContinue"
