# dotfiles
a repository for dotfiles

# add following to ~/.zshrc
```bash
source $HOME/.profile
source $HOME/dotfiles/.func
source $HOME/dotfiles/aliases
source $HOME/dotfiles/exports
source $HOME/dotfiles/styles
```

# add following to ~/.tmux.conf
```s
source-file ~/dotfiles/tmux/tmux.tpm.conf
source-file ~/dotfiles/tmux/tmux.bindkey.conf
source-file ~/dotfiles/tmux/tmux.options.conf
```

# get .tmux.reset.conf
```bash
$ tmux -f /dev/null -L temp start-server \; list-keys > ./.tmux.reset.conf

```
