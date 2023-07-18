rm -f $HOME/.config/nvim/lua
rm -f $HOME/.config/nvim/init.lua
rm -f $HOME/.gitconfig
rm -f $HOME/.gitignore
rm -f $HOME/.ignore
rm -f $HOME/.bashrc
rm -f $HOME/.alacritty.yml
rm -f $HOME/.tmux.conf
rm -f $HOME/bin

mkdir -p $HOME/.config/nvim

ln -s $CODE_DIR/dotfiles/files/common/lua $HOME/.config/nvim/lua
ln -s $CODE_DIR/dotfiles/files/common/colors $HOME/.config/nvim/colors
ln -s $CODE_DIR/dotfiles/files/common/init.lua $HOME/.config/nvim/init.lua
ln -s $CODE_DIR/dotfiles/files/common/gitconfig $HOME/.gitconfig
ln -s $CODE_DIR/dotfiles/files/common/gitignore $HOME/.gitignore
ln -s $CODE_DIR/dotfiles/files/common/ignore $HOME/.ignore
ln -s $CODE_DIR/dotfiles/files/linux/bashrc $HOME/.bashrc
ln -s $CODE_DIR/dotfiles/files/linux/alacritty.yml $HOME/.alacritty.yml
ln -s $CODE_DIR/dotfiles/files/linux/tmux.conf $HOME/.tmux.conf
ln -s $CODE_DIR/dotfiles/files/linux/bin $HOME/bin
