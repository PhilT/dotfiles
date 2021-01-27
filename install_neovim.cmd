@echo off
echo Installing Neovim

rem --- Install Neovim nightly and VimPlug
choco install neovim --pre
powershell "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni \"$env:LOCALAPPDATA/nvim-data/site/autoload/plug.vim\" -Force"

rem --- Install the neovim language integrations

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

rem Right-click Edit on a file to use
choco install notepadreplacer --params="/NOTEPAD:$env:ChocolateyToolsLocation\neovim\Neovim\bin\nvim.exe /verysilent"
