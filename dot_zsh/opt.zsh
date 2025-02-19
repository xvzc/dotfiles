#!/bin/zsh
# vim:filetype=sh:tw=80:et

### directory stack
setopt AUTO_PUSHD
setopt pushdsilent # Omit printing directory stack
setopt pushdminus  # Invert meanings of +N and -N arguments to pushd
### directory stack end

# Enable hex color codes
zmodload zsh/nearcolor

HISTFILE="$HOME/.zsh_history" # location of the history file
SAVEHIST=1000
HISTSIZE=1200 # current session's history limit, also following this https://unix.stackexchange.com/a/595475 $HISTSIZE should be at least 20% bigger than $SAVEHIST 

setopt INC_APPEND_HISTORY # history file is updated immediately after a command is entered
setopt SHARE_HISTORY # allows multiple Zsh sessions to share the same command history 
setopt EXTENDED_HISTORY # records the time when each command was executed
setopt APPENDHISTORY # ensures that each command entered in the current session is appended to the history file immediately after execution




