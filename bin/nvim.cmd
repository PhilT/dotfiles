@echo off
cd %1

"C:\Program Files\nvim\bin\nvim.exe" --cmd "let g:ayucolor='mirage'" %2 %3 %4 %5 %6

