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
```tmux
source-file $DOT_FILES/tmux/tmux.tpm.conf
source-file $DOT_FILES/tmux/tmux.bindkey.conf
source-file $DOT_FILES/tmux/tmux.options.conf

```

# get .tmux.reset.conf
```bash
$ tmux -f /dev/null -L temp start-server \; list-keys > ./.tmux.reset.conf

```

# nvim
 coc-settings.json in nvim directory is a hard link of coc-settings.json in ~/.config/nvim/coc-settings.json
```vim
source ~/dotfiles/nvim/header.vim
source ~/dotfiles/nvim/plugin-settings.vim
source ~/dotfiles/nvim/actions.vim
source ~/dotfiles/nvim/functions.vim

source ~/dotfiles/nvim/mappings.vim
source ~/dotfiles/nvim/nvim-settings.vim
source ~/dotfiles/nvim/autocommand.vim

" this line should be at the last line
source ~/dotfiles/nvim/styles.vim
 ```

# flake8
 move flake8 file to ~./config/
