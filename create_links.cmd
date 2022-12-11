@echo off
echo Link to config files (e.g. .gitconfig/ignore init.lua)

echo Remove init.lua file/link
del /q %USERPROFILE%\.config\nvim\init.lua
echo.

echo Remove .gitconfig file/link
del /q %USERPROFILE%\.gitconfig
echo.

echo Remove .gitignore file/link
del /q %USERPROFILE%\.gitignore
echo.

echo Remove .ignore file/link
del /q %USERPROFILE%\.ignore
echo.

echo Remove script directory
rmdir /q %USERPROFILE%\script
echo.

echo Create links
mkdir %USERPROFILE%\.config\nvim
mklink %USERPROFILE%\.config\nvim\init.lua %CODE_DIR%\dotfiles\files\common\init.lua
mklink /d %USERPROFILE%\.config\nvim\lua %CODE_DIR%\dotfiles\files\common\lua
mklink %USERPROFILE%\.gitconfig %CODE_DIR%\dotfiles\files\common\gitconfig
mklink %USERPROFILE%\.gitignore %CODE_DIR%\dotfiles\files\common\gitignore
mklink %USERPROFILE%\.ignore %CODE_DIR%\dotfiles\files\common\ignore
mklink /d %USERPROFILE%\script %CODE_DIR%\dotfiles\files\windows\script
