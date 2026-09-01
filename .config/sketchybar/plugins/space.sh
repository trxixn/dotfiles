#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/style.sh" 2>/dev/null

# Fallbacks
: ${WS_BG_COLOR:=$BG1}
: ${WS_BG_COLOR_FOCUSED:=$ACCENT_COLOR}
: ${SHOW_EMPTY_WORKSPACES:=true}

SPACE_ID="$1"

# Check if this workspace has any windows
WINDOWS_COUNT=$(yabai -m query --spaces --space "$SPACE_ID" 2>/dev/null | /opt/homebrew/bin/jq -r '.windows | length' 2>/dev/null || echo 0)

# Should this workspace ALWAYS be shown (1-5)?
ALWAYS_SHOW=false
if [[ "$SHOW_EMPTY_WORKSPACES" = "true" ]] && [[ "$SPACE_ID" =~ ^[1-5]$ ]]; then
    ALWAYS_SHOW=true
fi

if [ "$SELECTED" = "true" ]; then
    # Current workspace: Always show, Accent colors
    # If focused bg is transparent, use accent color for label instead
    if [ "$WS_BG_COLOR_FOCUSED" = "0x00000000" ]; then
        sketchybar --set $NAME drawing=on \
                               background.color=$WS_BG_COLOR_FOCUSED \
                               label.color=$ACCENT_COLOR
    else
        sketchybar --set $NAME drawing=on \
                               background.color=$WS_BG_COLOR_FOCUSED \
                               label.color=$BG0
    fi
elif [ "$WINDOWS_COUNT" -gt 0 ] || [ "$ALWAYS_SHOW" = true ]; then
    # Show if it has windows OR if it is one of the permanent 1-5
    sketchybar --set $NAME drawing=on \
                           background.color=$WS_BG_COLOR \
                           label.color=$FG0
else
    # Hide if empty and not in the permanent list
    sketchybar --set $NAME drawing=off
fi
