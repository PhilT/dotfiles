git clone https://github.com/savq/paq-nvim.git "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/opt/paq-nvim

sudo apt install npm
sudo npm install -g --save typescript-language-server

./create_links.sh
./dotnet.sh

