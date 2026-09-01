#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"

CACHE_FILE="$HOME/.config/sketchybar/.network_cache"

STAT=$(netstat -ibI en0 | grep -E "^en0" | head -n 1 | awk '{print $7, $10}')
IN_BYTES=$(echo $STAT | awk '{print $1}')
OUT_BYTES=$(echo $STAT | awk '{print $2}')

if [ -f "$CACHE_FILE" ]; then
  read PREV_IN PREV_OUT < "$CACHE_FILE"
else
  PREV_IN=$IN_BYTES
  PREV_OUT=$OUT_BYTES
fi

echo "$IN_BYTES $OUT_BYTES" > "$CACHE_FILE"

# Calculate bytes per second (assuming update_freq=2)
DIFF_IN=$(((IN_BYTES - PREV_IN) / 2))
DIFF_OUT=$(((OUT_BYTES - PREV_OUT) / 2))

function format_speed() {
  local BYTES=$1
  if [ "$BYTES" -gt 1048576 ]; then
    echo "$(echo "scale=1; $BYTES / 1048576" | bc)M"
  elif [ "$BYTES" -gt 1024 ]; then
    echo "$((BYTES / 1024))K"
  else
    echo "0K"
  fi
}

DOWN_SPEED=$(format_speed $DIFF_IN)
UP_SPEED=$(format_speed $DIFF_OUT)

sketchybar --set network.down label="$DOWN_SPEED" \
           --set network.up label="$UP_SPEED"
