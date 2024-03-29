#!/bin/bash

error() {
	echo "[ERROR] $1"
	exit 1
}

check-1password() {
	if ! command -v op &>/dev/null; then
		error "1Password not found"
	fi

	if ! op whoami 2>/dev/null; then
		open -a 1Password
		error "Login 1password app"
	fi

	if ! ssh-add -l &>/dev/null; then
		open -a 1Password
		error "Setup 1password ssh-agent"
	fi
}

cur_os=$(uname)

assets_dir="$HOME/.config/assets"

# Install packages
if [ "$cur_os" = "Darwin" ]; then
	font_dir=~/Library/Fonts/
	brewfile="$HOME/.local/share/chezmoi/setup/Brewfile.personal"
	if ! brew bundle --no-lock --no-upgrade --file="$brewfile"; then
		error "Filed to install packages"
	fi

	source ~/.local/share/chezmoi/setup/macos-setup.sh && all
elif [ "$cur_os" = "Linux" ]; then
	font_dir=~/.local/share/fonts/
fi

check-1password

op read "op://Personal/SSH Github xvzc/public key" >~/.ssh/xvzc.pub &&
	chmod 600 ~/.ssh/xvzc.pub

op read "op://Personal/SSH Arch Linux/public key" >~/.ssh/arch.pub &&
	chmod 600 ~/.ssh/arch.pub

if [ -d "$assets_dir/.git" ]; then
	echo "'$assets_dir/.git' already exists."
	git --git-dir "$assets_dir/.git" remote set-url origin git@xvzc.github.com:xvzc/assets.git
else
	git clone git@xvzc.github.com:xvzc/assets.git "$assets_dir"
fi

cp ~/.config/assets/fonts/hesalche/ttf/hesalche-Light.ttf "$font_dir"
cp ~/.config/assets/fonts/hesalche/ttf/hesalche-Regular.ttf "$font_dir"

