#!/bin/bash

# Load your Tokyo Night colors
source "$HOME/.config/sketchybar/colors.sh"

WIFI_SSID=$(ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}')

if [ "$WIFI_SSID" = "" ]; then
  # Disconnected (Red slashed Wi-Fi icon)
  sketchybar --set $NAME label="" icon="􀙈" icon.color=$RED label.color=$RED
else
  # Connected (Cyan Wi-Fi icon)
  sketchybar --set $NAME label="" icon="􀙇" icon.color=$CYAN label.color=$FG0
fi
