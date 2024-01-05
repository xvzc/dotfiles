#!/bin/bash

CUR_OS=$(uname)

if ! brew bundle --no-lock --no-upgrade --file=~/.local/share/chezmoi/setup/Brewfile.personal; then
	echo "Filed to install packages"
	exit 1
fi

op read "op://Personal/SSH Github xvzc/public key" >~/.ssh/xvzc.pub &&
	chmod 600 ~/.ssh/xvzc.pub

op read "op://Personal/SSH Arch Linux/public key" >~/.ssh/arch.pub &&
	chmod 600 ~/.ssh/arch.pub

ASSETS_DIR="$HOME/.config/assets"
if [ -d "$ASSETS_DIR/.git" ]; then
	echo "'$ASSETS_DIR/.git' already exists."
	git --git-dir "$ASSETS_DIR/.git" remote set-url origin git@xvzc.github.com:xvzc/assets.git
else
	git clone git@xvzc.github.com:xvzc/assets.git $ASSETS_DIR
fi

# Install fonts
if [ "$CUR_OS" = "Darwin" ]; then
	cp ~/.config/assets/fonts/hesalche/ttf/hesalche-Light.ttf ~/Library/Fonts/
	cp ~/.config/assets/fonts/hesalche/ttf/hesalche-Regular.ttf ~/Library/Fonts/
elif [ "$CUR_OS" = "Linux" ]; then
	cp ~/.config/assets/fonts/hesalche/ttf/hesalche-Light.ttf ~/.local/share/fonts/
	cp ~/.config/assets/fonts/hesalche/ttf/hesalche-Regular.ttf ~/.local/share/fonts/
fi

# install cargo
curl https://sh.rustup.rs -sSf | sh
