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

dockutil --add "/Applications/Firefox Developer Edition.app" --no-restart
dockutil --add "/Applications/Proton Mail.app" --no-restart
dockutil --add "/Applications/Microsoft Outlook.app" --no-restart
dockutil --add "/Applications/Reminders.app" --no-restart
dockutil --add "/Applications/Notes.app" --no-restart
dockutil --add "/Applications/Stocks.app" --no-restart
dockutil --add "/Applications/Spotify.app" --no-restart
dockutil --add "/Applications/iTerm.app" --no-restart
dockutil --add "/Applications/ChatGPT.app" --no-restart

killall Finder
killall Dock
killall SystemUIServer
