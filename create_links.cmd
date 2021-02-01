@echo off
echo Link to config files (e.g. .gitconfig/ignore init.vim)

rm -Force %USERPROFILE%\.config\nvim\init.vim
rm -Force %USERPROFILE%\.gitconfig
rm -Force %USERPROFILE%\.gitignore
rm -Force %USERPROFILE%\.ignore

mklink %USERPROFILE%\.config\nvim\init.vim d:\code\dotfiles\files\config\nvim\init.vim
mklink %USERPROFILE%\.gitconfig d:\code\dotfiles\files\gitconfig
mklink %USERPROFILE%\.gitignore d:\code\dotfiles\files\gitignore
mklink %USERPROFILE%\.ignore d:\code\dotfiles\files\ignore


