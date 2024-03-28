#!/bin/zsh
# vim:filetype=sh:tw=80

_is_darwin && \
  export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

_is_linux && export SSH_AUTH_SOCK=~/.1password/agent.sock

export CLICOLOR=1
export CLICOLOR_FORCE=1

# esc key delay 
export KEYTIMEOUT=1 

# default editor
export EDITOR=nvim

# PATHS
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

for file in ~/.scripts/*; do # Add all directories in ~/.scripts
    [ -d "$dir" ] && export PATH="$dir:$PATH"
done

_is_darwin && export PATH="/opt/homebrew/bin:$PATH"

command -v go &> /dev/null && export PATH=${PATH}:`go env GOPATH`/bin
command -v bob &> /dev/null && export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

