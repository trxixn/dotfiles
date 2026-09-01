#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"
PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

COUNT=$(brew outdated | wc -l | tr -d ' ')

if [ "$COUNT" -gt 0 ]; then
  sketchybar --set $NAME label="$COUNT" icon.color=$GREEN drawing=on
else
  sketchybar --set $NAME drawing=off
fi
