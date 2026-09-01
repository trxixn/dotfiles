#!/bin/bash

# Exit SketchyBar
if pgrep -x "sketchybar" > /dev/null; then
  sketchybar --exit
fi

exec 'brew services stop sketchybar'

# Quit AeroSpace
if pgrep -x "AeroSpace" > /dev/null; then
  pkill -x "AeroSpace"
fi

# Restore macOS Menu Bar (Always visible)
defaults write NSGlobalDomain _HIHideMenuBar -bool false

# Restore macOS Dock (Always visible)
defaults write com.apple.dock autohide -bool false

# Restart affected services to apply changes
# Note: killall Dock is safe and fast. 
# killall ControlCenter refreshes the menu bar state.
killall Dock
killall ControlCenter

echo "macOS defaults restored. AeroSpace and SketchyBar stopped."
