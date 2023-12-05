#!/bin/zsh

# How to map zle widget?
# You will see zle: widgets can only be called when ZLE is active when you run `zle widget_name` command.
# It means that widgets can be called only when you write and edit your commands in the editor,
#   not when you send them to your TTY by hitting ENTER.
# As a result, we can call widgets inside widgets, 
#   because widgets are always called when ZLE is available. 
# And since we can call widgets using specific keystrokes, 
#   what about a widget which can run any widget? That’s exactly the purpose of execute-named-cmd. 
# It’s bound by default to the keystrokes ESC x for the emacs keymap and: 
#   for the vicmd keymap (Vi NORMAL mode).
# https://thevaluable.dev/zsh-line-editor-configuration-mouseless
# Do the following to map specific zle widget to a keyboard shortcut
# 
#####################################
# autoload -Uz widget_name          #
# zle -N widget_name                #
# bindkey -M vicmd '^a' widget_name #
#####################################

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    CUR_VI_MODE='NORMAL'
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
    CUR_VI_MODE='*'
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

function zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

zle -N zle-line-init

# Edit line in vim with ctrl-e:
autoload -Uz edit-command-line
zle -N edit-command-line

bindkey "^E" edit-command-line

# bindkey '^[[Z' reverse-menu-complete

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# bindkey "^p" history-beginning-search-backward
# bindkey "^n" history-beginning-search-forward

bindkey -a k history-beginning-search-backward
bindkey -a j history-beginning-search-forward
