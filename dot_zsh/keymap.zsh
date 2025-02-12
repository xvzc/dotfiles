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

# Edit line in vim with ctrl-e:
autoload -Uz edit-command-line
zle -N edit-command-line

# Remove keymaps
bindkey -r "^S"
bindkey -r "^D"

bindkey "^E" edit-command-line

# bindkey '^[[Z' reverse-menu-complete

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# bindkey "^p" history-beginning-search-backward
# bindkey "^n" history-beginning-search-forward

bindkey -a k history-beginning-search-backward
bindkey -a j history-beginning-search-forward
