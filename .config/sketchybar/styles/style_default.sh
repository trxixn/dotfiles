#!/bin/bash
# --- DEFAULT STYLE (current Tokyo Night style) ---
# Individual items with borders, floating appearance

# Bar configuration
export BAR_HEIGHT=42
export BAR_COLOR=0x00000000
export BAR_BLUR_RADIUS=0
export BAR_SHADOW=off
export BAR_BORDER_WIDTH=0
export BAR_BORDER_COLOR=$BORDER_COLOR
export BAR_PADDING_LEFT=10
export BAR_PADDING_RIGHT=10
export BAR_MARGIN=0
export BAR_CORNER_RADIUS=0
export BAR_Y_OFFSET=0
export BAR_NOTCH_WIDTH=0
export BAR_POSITION=top

# Item defaults
export ITEM_BG_COLOR=$BG1
export ITEM_BG_HEIGHT=32
export ITEM_BG_CORNER_RADIUS=0
export ITEM_BG_BORDER_WIDTH=3
export ITEM_BG_BORDER_COLOR=$BORDER_COLOR
export ITEM_PADDING_LEFT=2
export ITEM_PADDING_RIGHT=2
export ITEM_MARGIN=4

# Icon/Label padding
export ICON_PADDING_LEFT=10
export ICON_PADDING_RIGHT=4
export LABEL_PADDING_LEFT=4
export LABEL_PADDING_RIGHT=10

# Workspace specific
export WS_BG_COLOR=$BG1
export WS_BG_COLOR_FOCUSED=$ACCENT_COLOR
export WS_BG_HEIGHT=32
export WS_BG_CORNER_RADIUS=0
export WS_BG_BORDER_WIDTH=3
export WS_LABEL_PADDING_LEFT=12
export WS_LABEL_PADDING_RIGHT=12

# Feature toggles
export SHOW_MUSIC=true
export SHOW_DATE_ICON=true
export SHOW_CLOCK_ICON=true
export SHOW_EMPTY_WORKSPACES=true
export SHOW_WIFI_NAME=true
export DATE_TIME_AROUND_NOTCH=false
export DATE_FORMAT="+%m/%d"
