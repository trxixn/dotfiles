#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/style.sh" 2>/dev/null

# Fallback
: ${SHOW_WIFI_NAME:=true}

# get the wi fi name from ipconfig
WIFI_SSID=$(ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}')

if [ "$WIFI_SSID" = "" ]; then
  # Disconnected 
  if [ "$SHOW_WIFI_NAME" = "true" ]; then
    sketchybar --set $NAME label="Disconnected" label.drawing=on icon="􀙈" icon.color=$RED label.color=$RED
  else
    sketchybar --set $NAME label.drawing=off icon="􀙈" icon.color=$RED
  fi
else
  # Connected 
  if [ "$SHOW_WIFI_NAME" = "true" ]; then
    sketchybar --set $NAME label="$WIFI_SSID" label.drawing=on icon="􀙇" icon.color=$CYAN label.color=$FG0
  else
    sketchybar --set $NAME label.drawing=off icon="􀙇" icon.color=$CYAN
  fi
fi
