@echo off
echo Link to config files (e.g. .gitconfig/ignore init.lua)

del /q %USERPROFILE%\.config\nvim\init.lua
del /q %USERPROFILE%\.gitconfig
del /q %USERPROFILE%\.gitignore
del /q %USERPROFILE%\.ignore
del /q %USERPROFILE%\bin

mklink %USERPROFILE%\.config\nvim\init.lua d:\code\dotfiles\files\config\nvim\init.lua
mklink %USERPROFILE%\.gitconfig d:\code\dotfiles\files\gitconfig
mklink %USERPROFILE%\.gitignore d:\code\dotfiles\files\gitignore
mklink %USERPROFILE%\.ignore d:\code\dotfiles\files\ignore
mklink /d %USERPROFILE%\bin d:\code\dotfiles\files\bin
