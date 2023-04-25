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

