#!/bin/bash
# vim:ft=sh ts=2 sw=2

error() {
	echo "[ERROR] $1"
	exit 1
}

require-sudo() {
	sudo -v --prompt "Administrator privilege required. Please type your password: "

	# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done 2>/dev/null &
}

install-xcode() {
	if ! xcode-select --print-path &>/dev/null; then
		# Install XCode Command Line Tools.
		xcode-select --install &>/dev/null

		# Wait until XCode Command Line Tools installation has finished.
		until xcode-select --print-path &>/dev/null; do
			sleep 1
		done
	fi
}

install-brew() {
	if ! /opt/homebrew/bin/brew shellenv 2>&1; then
		echo "homdbrew not found. installing.."
		require-sudo

		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
		if [ $? -ne 0 ]; then
			error "Failed to install brew"
		fi
	else
		echo "Found brew at $(whereis brew). Skipping install."
	fi

	if ! eval "$(/opt/homebrew/bin/brew shellenv)"; then
		error "Failed to run brew shellenv"
	fi
}

install-chezmoi() {
	if type chezmoi >/dev/null 2>&1; then
		echo "Found chezmoi at $(whereis chezmoi). Skipping install."
	else
		echo "chezmoi not found. installing.."
		if ! sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"; then
			error "Failed to install chezmoi"
		fi
		export PATH="$HOME/.local/bin:$PATH"
	fi

	chezmoi init github.com/xvzc/dotfiles || error "Filed to init chezmoi"
	chezmoi apply -R || error "Failed to apply dotfiles"
}

# Determine OS
uname_out="$(uname -s)"
case "${uname_out}" in
Linux*) machine=Linux ;;
Darwin*) machine=Mac ;;
*) machine="UNKNOWN:${uname_out}" ;;
esac

echo "Detected OS: ${machine}"

if [ "$machine" == "Mac" ]; then
	install-xcode
	install-chezmoi
	install-brew
	brewfile="$HOME/.local/share/chezmoi/setup/Brewfile"
	if ! brew bundle --no-lock --no-upgrade --file="$brewfile"; then
		error "Failed to install MacOS packages"
	fi

	source "$HOME/.local/share/chezmoi/setup/macos-setup.sh" && all
elif [ "$machine" == "Linux" ]; then
	echo "Installing Linux packages.."
	yay -S --needed --noconfirm - < ~/.local/share/chezmoi/setup/arch-packages.txt

	#################################################################
	#                                                               #
	# INSTALL NIMF HERE                                             #
	# - https://github.com/hamonikr/nimf                            #
	#                                                               #
	# INSTALL ROFI THEMES HERE                                      #
	# - https://github.com/Murzchnvok/rofi-collection               #
	#                                                               #
	#################################################################
else
	error "Cannot determine operating system."
fi

# install cargo
if ! command -v cargo &> /dev/null; then
	curl https://sh.rustup.rs -sSf | sh
fi

# Install neovim version manager
bob install nightly
bob use nightly
