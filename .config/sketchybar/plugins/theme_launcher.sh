#!/bin/bash

# ADDED TOKYOLIGHT HERE
THEMES="tokyonight\ngruvbox\ntokyolight"
THEME_FILE="$HOME/.config/sketchybar/.current_theme"
CURRENT_THEME=$(cat "$THEME_FILE" 2>/dev/null)

FONT_NAME="Victor Mono"
FONT_SIZE=18

if [ "$CURRENT_THEME" = "tokyonight" ]; then
    BG_COLOR="#1a1b26"       
    FG_COLOR="#c0caf5"       
elif [ "$CURRENT_THEME" = "gruvbox" ]; then
    BG_COLOR="#1d2021"       
    FG_COLOR="#ebdbb2"
elif [ "$CURRENT_THEME" = "tokyolight" ]; then
    # --- Tokyo Day Menu Colors ---
    BG_COLOR="#e1e2e7"       # Crisp off-white
    FG_COLOR="#3760bf"       # Deep blue
fi

CHOICE=$(echo -e "$THEMES" | /opt/homebrew/bin/choose -b "$BG_COLOR" -c "$FG_COLOR" -f "$FONT_NAME" -s "$FONT_SIZE")

if [ -n "$CHOICE" ]; then
    ~/.config/sketchybar/plugins/apply_theme.sh "$CHOICE"
fi
