#!/bin/bash

POPUP_OFF='sketchybar --set apple.logo popup.drawing=off'
POPUP_CLICK_SCRIPT='sketchybar --set $NAME popup.drawing=toggle'

apple_logo=(
  icon=""
  icon.font="SF Pro:Black:18.0"
  icon.color=$ACCENT_COLOR
  padding_right=5
  padding_left=5
  label.drawing=off
  click_script="$POPUP_CLICK_SCRIPT"
  script="[ \"\$SENDER\" = \"mouse.exited.global\" ] && $POPUP_OFF"
  popup.background.border_width=2
  popup.background.corner_radius=9
  popup.background.border_color=$BORDER_COLOR
  popup.background.color=$BG1
)

apple_sleep=(
  icon="󰒲"
  icon.font="VictorMono Nerd Font Mono:Bold:14.0"
  label="Sleep"
  click_script="pmset displaysleepnow; $POPUP_OFF"
)

apple_restart=(
  icon="󰜉"
  icon.font="VictorMono Nerd Font Mono:Bold:14.0"
  label="Restart"
  click_script="osascript -e 'tell app \"System Events\" to restart'; $POPUP_OFF"
)

apple_shutdown=(
  icon="󰐥"
  icon.font="VictorMono Nerd Font Mono:Bold:14.0"
  icon.color=$RED
  label="Shut Down"
  click_script="osascript -e 'tell app \"System Events\" to shut down'; $POPUP_OFF"
)

sketchybar --add item apple.logo left                  \
           --set apple.logo "${apple_logo[@]}"         \
           --subscribe apple.logo mouse.exited.global  \
                                                       \
           --add item apple.sleep popup.apple.logo     \
           --set apple.sleep "${apple_sleep[@]}"       \
                                                       \
           --add item apple.restart popup.apple.logo   \
           --set apple.restart "${apple_restart[@]}"   \
                                                       \
           --add item apple.shutdown popup.apple.logo  \
           --set apple.shutdown "${apple_shutdown[@]}"
