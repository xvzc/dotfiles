#!/bin/zsh

# zsh-syntax-highlight color
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=green
ZSH_HIGHLIGHT_STYLES[alias]=fg=green
ZSH_HIGHLIGHT_STYLES[builtin]=fg=green
ZSH_HIGHLIGHT_STYLES[command]=fg=green
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=blue
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=blue
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[comment]=fg=#7d807e
#ZSH_HIGHLIGHT_STYLES[assign]=none
#ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
#ZSH_HIGHLIGHT_STYLES[function]=none
#ZSH_HIGHLIGHT_STYLES[precommand]=fg=none
#ZSH_HIGHLIGHT_STYLES[commandseparator]=none
#ZSH_HIGHLIGHT_STYLES[hashed-command]=none
#ZSH_HIGHLIGHT_STYLES[globbing]=none
#ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue

# change the path color
zstyle :prompt:pure:path color blue
#zstyle :prompt:pure:git:dirty color '#5e5d49'
#zstyle :prompt:pure:git:branch color '#5e5d49'
zstyle :prompt:pure:git:dirty color red
zstyle :prompt:pure:git:branch color 'cyan'

#zstyle :prompt:pure:git:branch:cached color 42
zstyle :prompt:pure:virtualenv color '#5e5d49'
# zstyle :prompt:pure:virtualenv color 'blue'

zstyle :prompt:pure:prompt:error color red
zstyle :prompt:pure:prompt:success color '#f5b5f4'

# turn on git stash status
zstyle :prompt:pure:virtualenv show yes
 
