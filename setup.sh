./ruby-install.sh
./chruby.sh
source ./files/linux/bashrc
./create_links.sh

sudo apt install ripgrep
./files/linux/bin/update-nvim
packdir="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack
rm -rf $packdir
git clone https://github.com/savq/paq-nvim.git $packdir/paqs/start/paq-nvim

sudo apt install npm
sudo npm install -g --save typescript-language-server

./dotnet.sh
dotnet tool install --global fsautocomplete

# Swap CAPS and CTRL keys
setxkbmap -layout gb -option ctrl:swapcaps

sudo apt install alacritty tmux

# For installing an AppImage such as Neovim (may not be required once Neovim
# starts to depend on FUSE 3)
sudo apt install libfuse2
