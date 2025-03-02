#!/usr/bin/env bash
set -euo pipefail

if ! xcode-select -p &>/dev/null; then
    xcode-select --install
else
    echo "Xcode is already installed."
fi
