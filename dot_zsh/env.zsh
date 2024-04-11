#!/bin/zsh
# vim:filetype=sh:tw=80

# ┌────────────┐ 
# │ COMMON ENV │ 
# └────────────┘ 
export CLICOLOR=1
export CLICOLOR_FORCE=1

# esc key delay 
export KEYTIMEOUT=1 

# default editor
export EDITOR=nvim

# PATHS
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts/git:$PATH"

# ┌─────────────────┐ 
# │ CONDITIONAL ENV │ 
# └─────────────────┘ 
_is_darwin && \
  export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

_is_darwin && export PATH="/opt/homebrew/bin:$PATH"

_is_linux && export SSH_AUTH_SOCK=~/.1password/agent.sock

command -v go &> /dev/null && export PATH=`go env GOPATH`/bin:$PATH
command -v bob &> /dev/null && export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

