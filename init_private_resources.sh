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
}

check-1password

op read --force \
  "op://mbqg52gjbireiglzwrrck5nbcm/br6vmskxg3yyesbwjfv2zev46y/public key" \
  | tr -d "\015" > ~/.ssh/xvzc.pub && \
	chmod 600 ~/.ssh/xvzc.pub

op read --force \
  "op://mbqg52gjbireiglzwrrck5nbcm/br6vmskxg3yyesbwjfv2zev46y/private key?ssh-format=openssh" \
  | tr -d '\015' > ~/.ssh/xvzc && \
  chmod 600 ~/.ssh/xvzc

op read --force \
  "op://mbqg52gjbireiglzwrrck5nbcm/6dnb4xqgeh2voofslw3dr35dw4/public key" \
  | tr -d '\015' > ~/.ssh/arch.pub && \
  chmod 600 ~/.ssh/arch.pub

op read --force \
  "op://mbqg52gjbireiglzwrrck5nbcm/6dnb4xqgeh2voofslw3dr35dw4/private key?ssh-format=openssh" \
  | tr -d '\015' > ~/.ssh/arch && \
  chmod 600 ~/.ssh/arch
