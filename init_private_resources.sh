#!/bin/bash

op read "op://Personal/SSH Github xvzc/public key" > ~/.ssh/xvzc.pub && \
  chmod 600 ~/.ssh/xvzc.pub

op read "op://Personal/SSH Arch Linux/public key" > ~/.ssh/arch.pub && \
  chmod 600 ~/.ssh/arch.pub

NVIM_DIR="$HOME/.config/nvim"
if [ -d "$NVIM_DIR/.git" ]; then
  echo "'$NVIM_DIR/.git' already exists. setting remote url"
  git --git-dir "$NVIM_DIR/.git" remote set-url origin git@xvzc.github.com:xvzc/nvim.git
else
  rm -rf "$NVIM_DIR"
  git clone git@xvzc.github.com:xvzc/nvim.git $NVIM_DIR
fi

ASSETS_DIR="$HOME/.config/assets"
if [ -d "$ASSETS_DIR/.git" ]; then
  echo "'$ASSETS_DIR/.git' already exists. setting remote url"
  git --git-dir "$ASSETS_DIR/.git" remote set-url origin git@xvzc.github.com:xvzc/assets.git
else
  rm -rf "$ASSETS_DIR"
  git clone git@xvzc.github.com:xvzc/assets.git $ASSETS_DIR
fi

_is_darwin && cp ~/.config/assets/fonts/hesalche/ttf/hesalche-Light.ttf ~/Library/Fonts/
_is_darwin && cp ~/.config/assets/fonts/hesalche/ttf/hesalche-Regular.ttf ~/Library/Fonts/

_is_linux && cp ~/.config/assets/fonts/hesalche/ttf/hesalche-Light.ttf ~/.local/share/fonts/
_is_linux && cp ~/.config/assets/fonts/hesalche/ttf/hesalche-Regular.ttf ~/.local/share/fonts/
