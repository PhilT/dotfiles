@echo off
echo Link to config files (e.g. .gitconfig/ignore init.lua)

del /q %USERPROFILE%\.config\nvim\init.lua
del /q %USERPROFILE%\.gitconfig
del /q %USERPROFILE%\.gitignore
del /q %USERPROFILE%\.ignore
rmdir /q %USERPROFILE%\script

mklink %USERPROFILE%\.config\nvim\init.lua %CODE_DIR%\dotfiles\files\common\init.lua
mklink %USERPROFILE%\.gitconfig %CODE_DIR%\dotfiles\files\common\gitconfig
mklink %USERPROFILE%\.gitignore %CODE_DIR%\dotfiles\files\common\gitignore
mklink %USERPROFILE%\.ignore %CODE_DIR%\dotfiles\files\common\ignore
mklink /d %USERPROFILE%\script %CODE_DIR%\dotfiles\files\windows\script
