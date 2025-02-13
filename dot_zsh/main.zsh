#!/bin/zsh

# ┌─────────┐ 
# │ PLUGINS │ 
# └─────────┘ 

# zsh-defer
zi light romkatv/zsh-defer

zi ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zi light starship/starship
export STARSHIP_CONFIG="$HOME/.config/starship/config.toml"

# zsh-vi-mode
zi ice depth=1
zi light jeffreytse/zsh-vi-mode
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
ZVM_VI_HIGHLIGHT_BACKGROUND=white
ZVM_VI_HIGHLIGHT_FOREGROUND=black

# zsh-syntax-highlighting
zi light zsh-users/zsh-syntax-highlighting

# zsh-autoswitch-virtualenv
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

# Remove keymaps
bindkey -r "^S"
bindkey -r "^D"

# Edit line in vim with ctrl-e:
autoload -Uz edit-command-line
zle -N edit-command-line

bindkey "^E" edit-command-line

