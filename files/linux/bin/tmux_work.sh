tmux \
  new-session  -c $WORK_DIR -s work 'bash --init-file <(echo ". \"$HOME/.bashrc\"; nvim; pwd")' \; \
  split-window -c $WORK_DIR -v -l 20 \; \
  split-window -c $WORK_DIR -h -l 70 '/usr/bin/redis-server --databases 26' \; \
  split-window -c $WORK_DIR -v -p 80 'chruby-exec ruby-2.6.3 -- bin/rails s' \; \
  select-pane -t 0 \; \
  attach
