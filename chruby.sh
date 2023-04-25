pushd $HOME
mkdir -p src
cd src
rm -rf chruby-0.3.9
rm -f chruby-0.3.9.tar.gz
wget https://github.com/postmodern/chruby/releases/download/v0.3.9/chruby-0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
popd
