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
		error "Signin to 1password cli. run 'op signin'"
	fi
}

check-1password

op read --force \
  "op://mbqg52gjbireiglzwrrck5nbcm/br6vmskxg3yyesbwjfv2zev46y/public key" \
  | tr -d "\015" > ~/.ssh/xvzc.pub && \
	chmod 600 ~/.ssh/xvzc.pub

op read --force \
  "op://qjudjahzxxfny6mrwuvrlfbmpm/njvsdrtofuehwaftqoemmqe4cm/public key" \
  | tr -d "\015" > ~/.ssh/kwanghoo93.pub && \
	chmod 600 ~/.ssh/kwanghoo93.pub

op read --force \
  "op://mbqg52gjbireiglzwrrck5nbcm/6dnb4xqgeh2voofslw3dr35dw4/public key" \
  | tr -d '\015' > ~/.ssh/arch.pub && \
  chmod 600 ~/.ssh/arch.pub
