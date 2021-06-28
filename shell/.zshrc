zmodload zsh/zprof
skip_global_compinit=1

ZSH_DISABLE_COMPFIX="true"

ZSH_THEME=""
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
	fzf
	osx
    zsh-syntax-highlighting
    docker 
    docker-compose
)

source $HOME/.profile
source $HOME/dotfiles/shell/func
source $HOME/dotfiles/shell/aliases
source $HOME/dotfiles/shell/variables
source $HOME/dotfiles/shell/styles

source $ZSH/oh-my-zsh.sh

bindkey -v # vim keymapping on shell

fpath+=$HOME/.pure
zmodload zsh/nearcolor

autoload -U promptinit; promptinit

prompt pure
