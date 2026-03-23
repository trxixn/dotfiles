#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)

# Check if Mac is charging
CHARGING=$(pmset -g batt | grep 'AC Power')

if [[ $CHARGING != "" ]]; then
  ICON="󰂄"
  COLOR=$CYAN
else
  # Discharging Icons based on percentage
  case ${BATT_PERCENT} in
    [8-9][0-9]|100) ICON="󰁹" ; COLOR=$CYAN;;
    [6-7][0-9]) ICON="󰂀" ; COLOR=$CYAN;;
    [3-5][0-9]) ICON="󰁾" ; COLOR=$CYAN;;
    [1-2][0-9]) ICON="󰁺" ; COLOR=$RED ;;
    *) ICON="󰂎" ; COLOR=$RED ;;
  esac
fi

sketchybar --set $NAME icon="$ICON" icon.color=$COLOR label="${BATT_PERCENT}%"
