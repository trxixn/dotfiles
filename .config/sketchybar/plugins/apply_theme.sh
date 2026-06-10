#!/bin/bash

THEME_FILE="$HOME/.config/sketchybar/.current_theme"
KITTY_DIR="$HOME/.config/kitty"
BORDERS_DIR="$HOME/.config/borders"
SKETCHY_DIR="$HOME/.config/sketchybar"

SELECTED_THEME=$1

if [ "$SELECTED_THEME" = "tokyonight" ]; then
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/traiansfarghiu/Documents/night.jpg"'
    echo "tokyonight" > "$THEME_FILE"
    
    cp "$KITTY_DIR/tokyo.conf" "$KITTY_DIR/current-theme.conf"
    cp "$BORDERS_DIR/borders_tokyo" "$BORDERS_DIR/bordersrc"
    cp "$SKETCHY_DIR/colors/colors_tokyonight.sh" "$SKETCHY_DIR/colors.sh"
    cp "$SKETCHY_DIR/styles/style_default.sh" "$SKETCHY_DIR/style.sh"

elif [ "$SELECTED_THEME" = "gruvbox" ]; then
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/traiansfarghiu/Documents/gruv1.jpg"'
    echo "gruvbox" > "$THEME_FILE"
    
    cp "$KITTY_DIR/gruvbox.conf" "$KITTY_DIR/current-theme.conf"
    cp "$BORDERS_DIR/borders_gruv" "$BORDERS_DIR/bordersrc"
    cp "$SKETCHY_DIR/colors/colors_gruvbox.sh" "$SKETCHY_DIR/colors.sh"
    cp "$SKETCHY_DIR/styles/style_default.sh" "$SKETCHY_DIR/style.sh"

elif [ "$SELECTED_THEME" = "tokyolight" ]; then
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to false'
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/traiansfarghiu/Documents/temple.jpg"'
    echo "tokyolight" > "$THEME_FILE"
    
    cp "$KITTY_DIR/tokyolight.conf" "$KITTY_DIR/current-theme.conf"
    cp "$BORDERS_DIR/borders_tokyolight" "$BORDERS_DIR/bordersrc"
    cp "$SKETCHY_DIR/colors/colors_tokyolight.sh" "$SKETCHY_DIR/colors.sh"
    cp "$SKETCHY_DIR/styles/style_default.sh" "$SKETCHY_DIR/style.sh"

elif [ "$SELECTED_THEME" = "nordic" ]; then
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/traiansfarghiu/Documents/nordic.jpg"'
    echo "nordic" > "$THEME_FILE"
    
    # Use tokyo kitty/borders as fallback (or create nordic versions)
    cp "$KITTY_DIR/tokyo.conf" "$KITTY_DIR/current-theme.conf"
    cp "$BORDERS_DIR/borders_tokyo" "$BORDERS_DIR/bordersrc"
    cp "$SKETCHY_DIR/colors/colors_nordic.sh" "$SKETCHY_DIR/colors.sh"
    cp "$SKETCHY_DIR/styles/style_longbar.sh" "$SKETCHY_DIR/style.sh"
fi

sketchybar --set theme_menu popup.drawing=off 2>/dev/null

# Reload the system
sketchybar --reload
killall -USR1 kitty 2>/dev/null
"$BORDERS_DIR/bordersrc" 2>/dev/null
