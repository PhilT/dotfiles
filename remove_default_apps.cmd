@echo off
rem Remove some built-in apps
powershell -NoProfile -Command "Get-AppxPackage Microsoft.YourPhone -AllUsers | Remove-AppxPackage"
powershell -NoProfile -Command "Get-AppxPackage *officehub* | Remove-AppxPackage"
powershell -NoProfile -Command "Get-AppxPackage *zunemusic* | Remove-AppxPackage"
powershell -NoProfile -Command "Get-AppxPackage *onenote* | Remove-AppxPackage"


