#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"

# Check if this workspace has any windows
WINDOWS=$(aerospace list-windows --workspace "$1")

# Should this workspace ALWAYS be shown (1-5)?
ALWAYS_SHOW=false
if [[ "$1" =~ ^[1-5]$ ]]; then
    ALWAYS_SHOW=true
fi

if [ "$1" = "$AEROSPACE_FOCUSED_WORKSPACE" ]; then
    # Current workspace: Always show, Accent colors
    sketchybar --set $NAME drawing=on \
                           background.color=$ACCENT_COLOR \
                           label.color=$BG1
elif [ "$WINDOWS" != "" ] || [ "$ALWAYS_SHOW" = true ]; then
    # Show if it has windows OR if it is one of the permanent 1-5
    sketchybar --set $NAME drawing=on \
                           background.color=$BG1 \
                           label.color=$FG0
else
    # Hide if empty and not in the permanent list
    sketchybar --set $NAME drawing=off
fi
