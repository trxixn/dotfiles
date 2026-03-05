#!/bin/bash

# Load your Catppuccin colors
source "$CONFIG_DIR/colors.sh"

# Find the Wi-Fi interface (usually en0)
WIFI_INTERFACE=$(networksetup -listallhardwareports | awk '/Hardware Port: Wi-Fi/{getline; print $2}')

# Fetch the unredacted SSID (requires 'sudo ipconfig setverbose 1' run once in terminal)
WIFI_SSID=$(ipconfig getsummary $WIFI_INTERFACE | awk -F ' SSID : ' '/ SSID : / {print $2}')

if [ "$WIFI_SSID" = "" ]; then
  # Disconnected State: Uses your RED color
  sketchybar --set $NAME icon="􀙈" \
                         label="Disconnected" \
                         icon.color=$RED \
                         label.color=$RED
else
  # Connected State: Uses your WHITE color for both
  sketchybar --set $NAME icon="􀙇" \
                         label="$WIFI_SSID" \
                         icon.color=$WHITE \
                         label.color=$WHITE
fi
