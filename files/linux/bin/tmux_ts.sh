tmux \
  new-session  -c $CODE_DIR/foxsoft/trackstats -s fs 'bash --init-file <(echo ". \"$HOME/.bashrc\"; nvim; pwd")' \; \
  split-window -c $CODE_DIR/foxsoft/trackstats -v -l 20 \; \
  split-window -c $CODE_DIR/foxsoft/trackstats -h \; \
  select-pane -t 0 \; \
  attach
