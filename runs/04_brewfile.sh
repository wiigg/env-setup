#!/usr/bin/env bash
set -euo pipefail

if [ ! -f "$(pwd)/Brewfile" ]; then
    echo "Brewfile not found in $(pwd). Ensure it is placed in the repository root."
    exit 1
fi

brew bundle --file=Brewfile
