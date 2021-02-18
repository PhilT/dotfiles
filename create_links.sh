rm -f $HOME/.config/nvim/init.vim && ln -s $CODE_DIR/dotfiles/files/common/init.lua $HOME/.config/nvim/init.lua
rm -f $HOME/.config/nvim/init.lua && ln -s $CODE_DIR/dotfiles/files/common/init.vim $HOME/.config/nvim/init.vim
rm -f $HOME/.bashrc && ln -s $CODE_DIR/dotfiles/files/linux/bashrc $HOME/.bashrc
rm -f $HOME/.tmux.conf && ln -s $CODE_DIR/dotfiles/files/linux/tmux.conf $HOME/.tmux.conf

