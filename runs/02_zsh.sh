#!/usr/bin/env bash
set -euo pipefail

if [ "$SHELL" != "/bin/zsh" ]; then
    echo "Changing default shell to zsh."
    chsh -s /bin/zsh
fi

if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git "${HOME}/.oh-my-zsh"
else
    echo "oh-my-zsh is already installed."
fi
