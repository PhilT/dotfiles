tmux \
  new-session  -c $FOXSOFT_DIR -s fox 'bash --init-file <(echo ". \"$HOME/.bashrc\"; nvim; pwd")' \; \
  split-window -c $FOXSOFT_DIR -v -l 20 'sleep 5; chruby-exec ruby-2.6.6 -- dip sh' \; \
  split-window -c $FOXSOFT_DIR -h -p 50 \; \
  split-window -c $FOXSOFT_DIR -v -p 50 'chruby-exec ruby-2.6.6 -- dip rails s' \; \
  select-pane -t 0 \; \
  attach
