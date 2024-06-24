#!/bin/zsh
# alias fcd='cd $(fd --type d --search-path=$HOME/_jry | fzf)'

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --reverse
  --height=40%
  --color=fg:#e0dada,fg+:#fbdada,bg:#313f54,bg+:#313f54
  --color=hl:#6bc9e1,hl+:#33eaff,info:#aaaa84,marker:#4fe62d
  --color=prompt:#f32d2d,spinner:#fdf905,pointer:#fdf905,header:#87afaf
  --color=border:#648f66,preview-bg:#1f2c3d,label:#aeaeae,query:#d9d9d9
  --border="bold" --border-label="" --preview-window="border-bold" --prompt="> "
  --marker="▪" --pointer="●" --separator="─" --scrollbar="┃"
  --info="right"'

export FZF_TMUX_OPTS=$FZF_DEFAULT_OPTS'
  -p80%,60%'

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='**'

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}

function fvi() {
  OUTPUT=$( \
  fd -L --type f --hidden --follow --exclude .git $1 | \
    fzf \
    --preview 'bat --style=numbers --color=always --line-range :500 {}' \
    --query=$1 \
  )

  if [[ ! -z $OUTPUT ]]; then
    vi $OUTPUT
  fi
}

function fcd() {
  OUTPUT=$( \
    fd -L --type d --hidden --search-path=$HOME | \
    fzf \
    --preview='tree {}' \
    --query=$1 \
  )

  if [[ ! -z $OUTPUT ]]; then
    cd $OUTPUT
  fi
}

function fif() {
  if [ ! "$#" -gt 0 ]; then echo "patterns"; return 1; fi
  rg --files-with-matches --no-messages $2 "$1" | fzf\
  --border\
  --height 80%\
  --extended\
  --ansi\
  --reverse\
  --cycle\
  --header 'Find in File'\
  --bind 'f1:execute(less -f {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort'\
  --bind 'alt-p:preview-up,alt-n:preview-down'\
  --bind 'ctrl-u:half-page-up,ctrl-d:half-page-down'\
  --bind '?:toggle-preview,alt-w:toggle-preview-wrap'\
  --bind 'alt-v:execute(nvim {} >/dev/tty </dev/tty)'\
  --preview "bat --theme='OneHalfDark' --style=numbers --color=always {} | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

