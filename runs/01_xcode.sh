#!/usr/bin/env bash
set -euo pipefail

if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    echo "Waiting for Xcode CLT to finish..."
    until xcode-select -p &>/dev/null; do
        sleep 10
    done
else
    echo "Xcode is already installed."
fi
