#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/style.sh" 2>/dev/null

# Fallback
: ${DATE_TIME_AROUND_NOTCH:=false}

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)

# Check if Mac is charging
CHARGING=$(pmset -g batt | grep 'AC Power')

if [[ $CHARGING != "" ]]; then
  ICON="󰂄"
  ICON_COLOR=$CYAN
else
  # Vertical battery icons based on percentage
  case ${BATT_PERCENT} in
    [8-9][0-9]|100) ICON="󰁹" ; ICON_COLOR=$CYAN;;
    [6-7][0-9]) ICON="󰂁" ; ICON_COLOR=$CYAN;;
    [3-5][0-9]) ICON="󰁾" ; ICON_COLOR=$YELLOW;;
    [1-2][0-9]) ICON="󰁻" ; ICON_COLOR=$RED ;;
    *) ICON="󰂎" ; ICON_COLOR=$RED ;;
  esac
fi

if [ "$DATE_TIME_AROUND_NOTCH" = "true" ]; then
  # Nordic style: icon on left (in label)
  sketchybar --set $NAME icon.drawing=off label="$ICON ${BATT_PERCENT}%" label.color=$FG0
else
  # Default style: icon on left
  sketchybar --set $NAME icon="$ICON" icon.drawing=on icon.color=$ICON_COLOR label="${BATT_PERCENT}%" label.color=$FG0
fi
