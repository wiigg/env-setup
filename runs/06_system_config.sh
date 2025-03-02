#!/usr/bin/env bash
set -euo pipefail

defaults write com.apple.dock orientation -string "right"

defaults write com.apple.dock tilesize -int 36

killall Dock
