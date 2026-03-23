#!/bin/bash

STATE_FILE="$HOME/.config/sketchybar/plugins/.stats_hidden"

if [ -f "$STATE_FILE" ]; then
    # -- SHOW EVERYTHING --
    rm "$STATE_FILE"
    
    # Restore Wi-Fi text and original padding
    sketchybar --set wifi label.drawing=on icon.padding_left=10
    
else
    # -- ZEN MODE --
    touch "$STATE_FILE"
    
    # Hide Wi-Fi text and center the icon in the box
    sketchybar --set wifi label.drawing=off icon.padding_left=6
    
fi
