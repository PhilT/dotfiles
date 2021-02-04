@echo off
echo Installing Neovim

rem # Install Neovim nightly
choco install neovim --pre

rem # Install Package manager
git clone https://github.com/savq/paq-nvim.git "$env:LOCALAPPDATA\nvim-data\site\pack\paqs\opt\paq-nvim"

rem # Install the neovim language integrations

rem Python 3
choco install visualcppbuildtools
py -m pip install --upgrade pip
py -m pip install neovim

rem Python 2
python -m pip install --upgrade pip
python -m pip install neovim

rem Ruby
gem install neovim

rem Node
npm -g install neovim

rem # Right-click Edit on a file to use
choco install notepadreplacer --params="/NOTEPAD:$env:ChocolateyToolsLocation\neovim\Neovim\bin\nvim.exe /verysilent"
