@echo off
cd %1

C:\tools\neovim\Neovim\bin\nvim.exe --cmd "let g:ayucolor='mirage'" %2 %3 %4 %5 %6

