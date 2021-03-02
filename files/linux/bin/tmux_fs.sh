tmux \
  new-session  -c $CODE_DIR/websites -s fs 'bash --init-file <(echo ". \"$HOME/.bashrc\"; nvim; pwd")' \; \
  split-window -c $CODE_DIR/websites -v -l 20 './start' \; \
  split-window -c $CODE_DIR/websites -h \; \
  select-pane -t 0 \; \
  attach
