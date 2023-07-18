@echo off
echo Link to config files (e.g. .gitconfig/ignore init.lua)

echo Creating nvim/ (might complain if it already exists)
mkdir %USERPROFILE%\.config\nvim
echo.

echo Replacing init.lua link
del /q %USERPROFILE%\.config\nvim\init.lua
mklink %USERPROFILE%\.config\nvim\init.lua %CODE_DIR%\dotfiles\files\common\init.lua
echo.

echo Replacing lua/
rmdir /q %USERPROFILE%\.config\nvim\lua
mklink /d %USERPROFILE%\.config\nvim\lua %CODE_DIR%\dotfiles\files\common\lua
echo.

echo Replacing colors/
rmdir /q %USERPROFILE%\.config\nvim\colors
mklink /d %USERPROFILE%\.config\nvim\colors %CODE_DIR%\dotfiles\files\common\colors
echo.

echo Replacing .gitconfig link
del /q %USERPROFILE%\.gitconfig
mklink %USERPROFILE%\.gitconfig %CODE_DIR%\dotfiles\files\common\gitconfig
echo.

echo Replacing .gitignore link
del /q %USERPROFILE%\.gitignore
mklink %USERPROFILE%\.gitignore %CODE_DIR%\dotfiles\files\common\gitignore
echo.

echo Replacing .ignore link
del /q %USERPROFILE%\.ignore
mklink %USERPROFILE%\.ignore %CODE_DIR%\dotfiles\files\common\ignore
echo.

echo Replacing script directory
rmdir /q %USERPROFILE%\script
mklink /d %USERPROFILE%\script %CODE_DIR%\dotfiles\files\windows\script
echo.

