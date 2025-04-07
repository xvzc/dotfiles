#!/bin/zsh

# ┌─────────┐ 
# │ PLUGINS │ 
# └─────────┘ 
## zsh-defer
zi light romkatv/zsh-defer

zi ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zi light starship/starship
export STARSHIP_CONFIG="$HOME/.config/starship/config.toml"

## zsh-vi-mode
zi ice depth=1
zi light jeffreytse/zsh-vi-mode
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
ZVM_VI_HIGHLIGHT_BACKGROUND=white
ZVM_VI_HIGHLIGHT_FOREGROUND=black

## zsh-syntax-highlighting
zi light zsh-users/zsh-syntax-highlighting

## zsh-autoswitch-virtualenv
zi wait lucid for MichaelAquilina/zsh-autoswitch-virtualenv

# ┌────────────┐ 
# │ COMMON ENV │ 
# └────────────┘ 
export CLICOLOR=1
export CLICOLOR_FORCE=1

# reduce esc delay 
export KEYTIMEOUT=1

# set default editor to nvim
export EDITOR=nvim

# ┌─────────┐ 
# │ VI-MODE │ 
# └─────────┘ 
bindkey -a k history-beginning-search-backward
bindkey -a j history-beginning-search-forward

# ┌─────────────────┐ 
# │ GENERAL KEYMAPS │ 
# └─────────────────┘ 
## Remove keymaps
bindkey -r "^S"
bindkey -r "^D"

## Edit line in vim with ctrl-e:
autoload -Uz edit-command-line
zle -N edit-command-line

bindkey "^E" edit-command-line

# ┌───────────────┐ 
# │ OTHER OPTIONS │ 
# └───────────────┘ 
## directory stack
setopt AUTO_PUSHD
setopt pushdsilent # Omit printing directory stack
setopt pushdminus  # Invert meanings of +N and -N arguments to pushd
## directory stack end

# Enable hex color codes
zmodload zsh/nearcolor

HISTFILE="$HOME/.zsh_history" # location of the history file
SAVEHIST=1000
HISTSIZE=1200 # current session's history limit, also following this https://unix.stackexchange.com/a/595475 $HISTSIZE should be at least 20% bigger than $SAVEHIST 

setopt INC_APPEND_HISTORY # history file is updated immediately after a command is entered
setopt SHARE_HISTORY # allows multiple Zsh sessions to share the same command history 
setopt EXTENDED_HISTORY # records the time when each command was executed
setopt APPENDHISTORY # ensures that each command entered in the current session is appended to the history file immediately after execution


