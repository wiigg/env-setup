#!/usr/bin/env bash
set -euo pipefail
set --

defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathBar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

defaults write com.apple.dock orientation -string "right"
defaults write com.apple.dock tilesize -int 42
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

defaults write com.apple.screencapture location "$HOME/Documents/Screenshots"
defaults write com.apple.screencapture type -string "png"

if ! command -v dockutil >/dev/null 2>&1; then
  echo "dockutil is not installed."
  exit 1
fi

dockutil --remove all --no-restart

add_dock_app() {
  local app="$1"
  if [ -d "$app" ]; then
    dockutil --add "$app" --no-restart
  else
    echo "Skipping missing app: $app"
  fi
}

add_dock_app "/Applications/Firefox Developer Edition.app"
add_dock_app "/Applications/Proton Mail.app"
add_dock_app "/Applications/Microsoft Outlook.app"
add_dock_app "/Applications/Reminders.app"
add_dock_app "/Applications/Notes.app"
add_dock_app "/Applications/Stocks.app"
add_dock_app "/Applications/Spotify.app"
add_dock_app "/Applications/iTerm.app"
add_dock_app "/Applications/ChatGPT.app"

killall Finder
killall Dock
killall SystemUIServer
