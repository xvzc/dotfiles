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

check-1password

op read "op://Personal/SSH Github xvzc/public key" >~/.ssh/xvzc.pub &&
	chmod 600 ~/.ssh/xvzc.pub

op read "op://Personal/SSH Arch Linux/public key" >~/.ssh/arch.pub &&
	chmod 600 ~/.ssh/arch.pub
