@echo off
echo Installing Neovim

rem # Install Neovim
choco install neovim

rem # Install Package manager
mkdir "%LOCALAPPDATA%\nvim-data\site\pack\paqs\start"
git clone https://github.com/savq/paq-nvim.git "%LOCALAPPDATA%\nvim-data\site\pack\paqs\start\paq-nvim"

rem # Install the neovim language integrations

rem Python 3
choco install visualcppbuildtools
py -m pip install --upgrade pip
py -m pip install neovim

rem Python 2
python -m pip install --upgrade pip
python -m pip install neovim

rem Ruby (Disabled as it requires ridk install (MSYS2) which needs user input)
rem gem install neovim

rem Node
npm -g install neovim

