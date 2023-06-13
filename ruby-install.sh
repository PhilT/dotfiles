pushd $HOME
mkdir -p src
cd src
wget https://github.com/postmodern/ruby-install/releases/download/v0.9.0/ruby-install-0.9.0.tar.gz
tar -xzvf ruby-install-0.9.0.tar.gz
cd ruby-install-0.9.0/
sudo make install

