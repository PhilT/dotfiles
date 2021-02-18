#rm -f $HOME/.config/nvim/init.vim && ln -s $CODE_DIR/dotfiles/files/common/init.lua $HOME/.config/nvim/init.lua
rm -f $HOME/.config/nvim/init.lua
rm -f $HOME/.gitconfig
rm -f $HOME/.gitignore
rm -f $HOME/.ignore
rm -f $HOME/.bashrc
rm -f $HOME/.tmux.conf

ln -s $CODE_DIR/dotfiles/files/common/init.lua $HOME/.config/nvim/init.lua
ln -s $CODE_DIR/dotfiles/files/common/gitconfig $HOME/.gitconfig
ln -s $CODE_DIR/dotfiles/files/common/gitignore $HOME/.gitignore
ln -s $CODE_DIR/dotfiles/files/common/ignore $HOME/.ignore
ln -s $CODE_DIR/dotfiles/files/linux/bashrc $HOME/.bashrc
ln -s $CODE_DIR/dotfiles/files/linux/tmux.conf $HOME/.tmux.conf
