#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

# get the wi fi name from ipconfig
WIFI_SSID=$(ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}')

if [ "$WIFI_SSID" = "" ]; then
  # Disconnected 
  sketchybar --set $NAME label="Disconnected" icon="􀙈" icon.color=$RED label.color=$RED
else
  # Connected 
  sketchybar --set $NAME label="$WIFI_SSID" icon="􀙇" icon.color=$CYAN label.color=$FG0
fi
