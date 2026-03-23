#!/bin/bash

THEME_FILE="$HOME/.config/sketchybar/.current_theme"
KITTY_DIR="$HOME/.config/kitty"
BORDERS_DIR="$HOME/.config/borders"
SKETCHY_DIR="$HOME/.config/sketchybar"

SELECTED_THEME=$1

if [ "$SELECTED_THEME" = "tokyonight" ]; then
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'
    echo "tokyonight" > "$THEME_FILE"
    
    cp "$KITTY_DIR/tokyo.conf" "$KITTY_DIR/current-theme.conf"
    cp "$BORDERS_DIR/borders_tokyo" "$BORDERS_DIR/bordersrc"
    cp "$SKETCHY_DIR/colors/colors_tokyonight.sh" "$SKETCHY_DIR/colors.sh"

elif [ "$SELECTED_THEME" = "gruvbox" ]; then
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'
    echo "gruvbox" > "$THEME_FILE"
    
    cp "$KITTY_DIR/gruvbox.conf" "$KITTY_DIR/current-theme.conf"
    cp "$BORDERS_DIR/borders_gruv" "$BORDERS_DIR/bordersrc"
    cp "$SKETCHY_DIR/colors/colors_gruvbox.sh" "$SKETCHY_DIR/colors.sh"

elif [ "$SELECTED_THEME" = "tokyolight" ]; then
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to false'
    echo "tokyolight" > "$THEME_FILE"
    
    cp "$KITTY_DIR/tokyolight.conf" "$KITTY_DIR/current-theme.conf"
    cp "$BORDERS_DIR/borders_tokyolight" "$BORDERS_DIR/bordersrc"
    cp "$SKETCHY_DIR/colors/colors_tokyolight.sh" "$SKETCHY_DIR/colors.sh"
fi

sketchybar --set theme_menu popup.drawing=off

# Reload the system
sketchybar --reload
killall -USR1 kitty
"$BORDERS_DIR/bordersrc"
