# dotfiles
Personal dotfiles managed by [chezmoi](https://github.com/twpayne/chezmoi).

# chezmoi init
`chezmoi init https://github.com/xvzc/dotfiles`

# install with curl
`curl -fsSL https://dotfiles.xvzc.dev | bash`

# how to install yabai properly

## Create certificate
(How to create certificate for yabai)[https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(from-HEAD)]

## Uninstall previous version
```sh
brew uninstall koekeishiya/formulae/yabai
```

## Install HEAD
```sh
brew install koekeishiya/formulae/yabai --HEAD
```

## Sign certification
```sh
codesign -fs 'yabai-cert' $(brew --prefix yabai)/bin/yabai
```

## Enable script addition
```sh
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
```

## Run other tools
```bash
brew services start borders
brew services start sketchybar
```



