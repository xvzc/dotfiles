#!/bin/bash

set -e

if [ "$(command -v chezmoi)" ]; then
  chezmoi=chezmoi
else
  mkdir -p ~/.local/bin
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsSL https://chezmoi.io/get)" -- -b ~/.local/bin
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://chezmoi.io/get)" -- -b ~/.local/bin
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
  chezmoi=~/.local/bin/chezmoi
fi

dotfiles="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
exec "$chezmoi" init --apply "--source=$dotfiles"
