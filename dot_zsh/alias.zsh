#!/bin/zsh
# vim:filetype=sh:tw=80


# ┌─────────┐ 
# │ GENERAL │ 
# └─────────┘ 

# alias sudo='sudo '
alias vi='nvim'

if [ "$(command -v eza)" ]; then
  alias l="ls"
  alias ls='eza --sort=type'
  alias la='eza -alg --sort=type'
fi

alias 'bat'='bat --style=plain'
alias 'bat -nu'='bat --style=numbers'

_is_linux && alias open='thunar'

alias lazygit='lazygit --use-config-file=$HOME/.config/lazygit/config.yml'
alias lg='lazygit --use-config-file=$HOME/.config/lazygit/config.yml'

alias py='python3'
alias python='python3'
alias wol='wakeonlan -i $(dig +short $HOME_DDNS) -p 9 $DESKTOP_MAC_ADDRESS'


# ┌─────────────┐ 
# │ DIRECTORIES │ 
# └─────────────┘ 
alias d='dirs -v'
alias 0='cd -0 &> /dev/null'
alias 1='cd -1 &> /dev/null'
alias 2='cd -2 &> /dev/null'
alias 3='cd -3 &> /dev/null'
alias 4='cd -4 &> /dev/null'
alias 5='cd -5 &> /dev/null'
alias 6='cd -6 &> /dev/null'
alias 7='cd -7 &> /dev/null'
alias 8='cd -8 &> /dev/null'
alias 9='cd -9 &> /dev/null'


# ┌─────┐ 
# │ GIT │ 
# └─────┘ 
alias ggpush='git push origin "$(git_current_branch)"'
alias ggpull='git pull origin "$(git_current_branch)"'

# ┌─────────┐ 
# │ CHEZMOI │ 
# └─────────┘ 
alias cz='chezmoi'
alias cvi='chezmoi edit --watch --hardlink=false'
alias czg='chezmoi git'
alias czu='chezmoi update'
alias czap='chezmoi apply'
alias czad='chezmoi add'
alias czc='cd ~/.local/share/chezmoi'
alias czr='chezmoi remove'
alias czf='chezmoi forget'

# ┌──────┐ 
# │ TMUX │ 
# └──────┘ 
alias tat='tmux -u attach-session -t'
alias tdt='tmux detach'
alias tkt='tmux kill-session -t'
alias tst='tmux -u switch -t'
alias tns='tmux -u new -c ~ -s'
alias tls='tmux ls'

# ┌────────┐ 
# │ DOCKER │ 
# └────────┘ 
alias dk='docker'
alias dkc='docker-compose'

# ┌────────────┐ 
# │ KUBERNETES │ 
# └────────────┘ 
if [ "$(command -v kubectl)" ]; then
  alias k='kubectl'

  alias kg='kubectl get'
  alias kgn='kubectl get nodes'
  alias kgs='kubectl get services'
  alias kgp='kubectl get pods'
  alias kgd='kubectl get deployments'
  alias kge='kubectl get events'
  alias kgrs='kubectl get replicasets.apps'

  alias kd='kubectl delete'
  alias kds='kubectl delete services'
  alias kdp='kubectl delete pods'
  alias kdd='kubectl delete deployments'
  alias kde='kubectl delete events'
  alias kdrs='kubectl delete replicasets.apps'

  alias kds='kubectl describe'
  alias kdss='kubectl describe services'
  alias kdsp='kubectl describe pods'
  alias kdsd='kubectl describe deployments'
  alias kdse='kubectl describe events'
  alias kdsrs='kubectl describe replicasets.apps'

  alias ke='kubectl edit'
  alias kes='kubectl edit services'
  alias kep='kubectl edit pods'
  alias ked='kubectl edit deployments'
  alias kee='kubectl edit events'
  alias kdrs='kubectl edit replicasets.apps'

  alias kcv='kubectl config view'
  alias kaf='kubectl apply -f'

  alias kx='kubectl exec'
  alias kxi='kubectl exec -it'
fi

# ┌───────────┐ 
# │ TERRAFORM │ 
# └───────────┘ 
alias tf='terraform'
alias tfi='terraform init'
alias tfg='terraform get'
alias tfr='terraform refresh'
alias tfo='terraform output'
alias tfd='terraform destroy'
alias tfu='terraform get --update'
alias tfa='terraform get --update && terraform apply -auto-approve'
alias tfp='terraform plan'

