#!/bin/bash

source "$HOME/.config/sketchybar/style.sh" 2>/dev/null

# Fallback to short format
: ${DATE_FORMAT:="+%m/%d"}

sketchybar --set $NAME label="$(date "$DATE_FORMAT")"
