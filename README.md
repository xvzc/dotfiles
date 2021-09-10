# dotfiles
A repository for dotfiles

# Instruction

## Cross platform setting
A variable which indicates the OS is set dynamically on shell startup. See echo ```$CUR_OS```

## Dependencies
```
zsh
oh-my-zsh
node
coc-nvim
vim-plug
tmux
tpm
oh-my-tmux
fzf
ripgrep
d2coding nerd font
ccls
sdkman
```

# Get .tmux.reset.conf
```bash
$ tmux -f /dev/null -L temp start-server \; list-keys > ./.tmux.reset.conf

```

# When CocInstall doesn't work with request timeout message
Especailly on WSL, There is an issue that the DNS server is set to a wrong destination, so temporary solution is to set DNS server like below.
```
echo "104.16.17.35\tregistry.npmjs.org" >> /etc/hosts
```

# Make hard links of main dotfiles with githooks
Make dotfiles like .zshrc, .tmux.conf.local etc .. hard links of files in this repository with git hook. See ```config.sh```
