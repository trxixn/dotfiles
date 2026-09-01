#!/bin/bash
# --- LONGBAR STYLE ---
# Unified solid bar spanning the full width, minimal aesthetic

# Bar configuration
export BAR_HEIGHT=36
export BAR_COLOR=$BG0
# export BAR_BLUR_RADIUS=20
# No Blur
export BAR_BLUR_RADIUS=0
export BAR_SHADOW=off
export BAR_BORDER_WIDTH=0
export BAR_BORDER_COLOR=$BORDER_COLOR
export BAR_PADDING_LEFT=16
export BAR_PADDING_RIGHT=16
export BAR_MARGIN=0
export BAR_CORNER_RADIUS=0
export BAR_Y_OFFSET=0
export BAR_NOTCH_WIDTH=0
export BAR_POSITION=top

# Item defaults
export ITEM_BG_COLOR=0x00000000
export ITEM_BG_HEIGHT=28
export ITEM_BG_CORNER_RADIUS=0
export ITEM_BG_BORDER_WIDTH=0
export ITEM_BG_BORDER_COLOR=$BORDER_COLOR
export ITEM_PADDING_LEFT=0
export ITEM_PADDING_RIGHT=0
export ITEM_MARGIN=6

# Icon/Label padding
export ICON_PADDING_LEFT=8
export ICON_PADDING_RIGHT=4
export LABEL_PADDING_LEFT=4
export LABEL_PADDING_RIGHT=8

# Workspace specific
export WS_BG_COLOR=0x00000000
export WS_BG_COLOR_FOCUSED=0x00000000
export WS_BG_HEIGHT=28
export WS_BG_CORNER_RADIUS=0
export WS_BG_BORDER_WIDTH=0
export WS_LABEL_PADDING_LEFT=10
export WS_LABEL_PADDING_RIGHT=10

# Feature toggles
export SHOW_MUSIC=false
export SHOW_DATE_ICON=false
export SHOW_CLOCK_ICON=false
export SHOW_EMPTY_WORKSPACES=false
export SHOW_WIFI_NAME=false
export DATE_TIME_AROUND_NOTCH=true
export DATE_FORMAT="+%A"
