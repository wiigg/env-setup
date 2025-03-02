#!/usr/bin/env bash
set -euo pipefail
set --

defaults write com.apple.dock orientation -string "right"

defaults write com.apple.dock tilesize -int 42

if ! command -v dockutil >/dev/null 2>&1; then
  echo "dockutil is not installed."
  exit 1
fi

dockutil --remove all --no-restart

dockutil --add "/Applications/Firefox Developer Edition.app" --no-restart
dockutil --add "/Applications/Proton Mail.app" --no-restart
dockutil --add "/Applications/Microsoft Outlook.app" --no-restart
dockutil --add "/Applications/Reminders.app" --no-restart
dockutil --add "/Applications/Notes.app" --no-restart
dockutil --add "/Applications/Stocks.app" --no-restart
dockutil --add "/Applications/Spotify.app" --no-restart
dockutil --add "/Applications/iTerm.app" --no-restart
dockutil --add "/Applications/ChatGPT.app" --no-restart

killall Dock
