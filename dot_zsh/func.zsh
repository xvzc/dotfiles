#!/bin/zsh

# utils
function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 100); do time $shell -i -c exit; done
}

function push() {
  git add .
  if [ -z "$1" ]
  then
    git commit -a -m "No commit message"
  else
    git commit -a -m "$1"
  fi
  git push
}

function _run_tmux_if_terminal_is_one_of() {
  arr=("$@")
  for i in "${arr[@]}";
  do
    if [ "$TERM_PROGRAM" = "$i" ] 
    then
      [ "$TMUX" = "" ] && (tmux attach-session -t "main" || tmux new -c ~ -s "main")
    fi
  done

  return 0
}

