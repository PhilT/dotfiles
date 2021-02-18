tmux \
  new-session  -c $CODE_DIR/websites -s sh24 $HOME/nvim.appimage \; \
  split-window -c $CODE_DIR/websites -v -l 20 \; \
  split-window -c $CODE_DIR/websites
#  split-window -c $CODE_DIR/sh24/admin -h -l 70 '/usr/bin/redis-server --databases 26' \; \
#  split-window -c $CODE_DIR/sh24/admin -v -p 80 'chruby-exec ruby-2.6.3 -- bin/rails s' \; \
  attach
