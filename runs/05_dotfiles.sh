#!/usr/bin/env bash
set -euo pipefail

DOTFILES_REPO="git@github.com:wiigg/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    echo "Dotfiles repository already exists at $DOTFILES_DIR."
    cd "$DOTFILES_DIR" && git pull && cd -
fi

if ! command -v stow >/dev/null 2>&1; then
    echo "GNU stow is not installed."
    exit 1
fi

cd "$DOTFILES_DIR"

stow -v -t "$HOME" *
