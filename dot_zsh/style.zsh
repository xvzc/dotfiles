#!/bin/zsh

export LS_COLORS="\
  rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01: \
  or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:ow=01;36:tw=01;35:st=37;44:ex=01;32: \
  *.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31: \
  *.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31: \
  *.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31: \
  *.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31: \
  *.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31: \
  *.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31: \
  *.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35: \
  *.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35: \
  *.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35: \
  *.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35: \
  *.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35: \
  *.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35: \
  *.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35: \
  *.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36: \
  *.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36: \
  *.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36: \
  *.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90: \
  *.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90: \
  *.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90: \
  *.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90: \
  *.pub=00;00:*.zwc=00;90: \
  "

export EZA_COLORS="da=00;00:uu=01;37:gu=01;37:"

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
# ZSH_HIGHLIGHT_STYLES[comment]='fg=#7d807e'
# ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#eb87ff'

# zstyle :prompt:pure:path color '#89a4f0'
zstyle :prompt:pure:path color blue

zstyle :prompt:pure:git:dirty color red
zstyle :prompt:pure:git:branch color cyan

zstyle :prompt:pure:prompt:error color red
zstyle :prompt:pure:prompt:success color '#f5b5f4'

zstyle :prompt:pure:virtualenv color '#5e5d49'
zstyle :prompt:pure:virtualenv show yes
 
# ┌──────────────────┐ 
# │ AUTO_COMPLETIONS │ 
# └──────────────────┘ 
# Initialize the autocompletion
# skip_global_compinit=1

# Do menu-driven completion.
zstyle ':completion:*' menu select
zstyle ':completion:*:*:git:*' user-commands \
  login:'authenticate current git repository with ssh key'

# formatting and messages
zstyle ':completion:*' verbose yes
# zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
# zstyle ':completion:*:messages' format '%d'
# zstyle ':completion:*:warnings' format "No matches"
# zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
# zstyle ':completion:*' group-name ''

# Completers for my own scripts
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

zstyle ':completion:*' list-colors "${LS_COLORS}"

# Better SSH/Rsync/SCP Autocomplete
# zstyle ':completion:*:ssh:*' hosts off
# zstyle ':completion:*:(ssh|scp|ftp|sftp):*' hosts $hosts
# zstyle ':completion:*:(ssh|scp|ftp|sftp):*' users $users

# Speed up zsh compinit by only checking cache once a day.
# autoload -Uz compinit
# for dump in ~/.zcompdump(N.mh+24); do
#   compinit -i
# done


