#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

# Check Bluetooth status using system_profiler
STATE=$(system_profiler SPBluetoothDataType | grep "State:" | awk '{print $2}')

if [ "$STATE" = "On" ]; then
  # Bluetooth is ON - Bright Blue Icon
  ICON="󰂯" 
  COLOR=$CYAN
else
  # Bluetooth is OFF - Muted Grey Icon
  ICON="󰂲" 
  COLOR=$BORDER_COLOR
fi

sketchybar --set $NAME icon="$ICON" icon.color=$COLOR
