#!/bin/zsh

# utils
function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 100); do time $shell -i -c exit; done
}

function is_linux() {
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

# gvm
function init_gvm(){
    [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
}

# sdkman
function init_sdkman(){
    #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
}

