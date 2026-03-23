#!/bin/bash
STATE=$(osascript -e 'tell application "Spotify" to player state' 2>/dev/null)

if [ "$STATE" = "playing" ]; then
  TRACK=$(osascript -e 'tell application "Spotify" to name of current track')
  ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track')
  sketchybar --set $NAME label="${TRACK} by ${ARTIST}" drawing=on
else
  sketchybar --set $NAME drawing=off
fi
