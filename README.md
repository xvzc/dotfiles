# Instruction
intall
```
node
coc-nvim
vim-plug
tmux
tpm
fzf
ripgrep
```

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
source $DOT_FILES/nvim/vim-plug.vim

source $DOT_FILES/nvim/nvim-settings.vim
source $DOT_FILES/nvim/keymap.vim
source $DOT_FILES/nvim/autocommand.vim

" load all plugin custom settings
for f in split(glob('$DOT_FILES/nvim/plugin/*.vim'), '\n')
    exe 'source' f
endfor

" this line should be at the last line
source $DOT_FILES/nvim/styles.vim
```

# flake8
 move flake8 file to ~./config/
