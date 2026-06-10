#!/bin/bash

sketchybar --add item wifi right \
           --set wifi script="$PLUGIN_DIR/wifi.sh" \
                      update_freq=15 \
                      icon.padding_left=10 \
                      label.padding_right=10 \
                      click_script="open /System/Library/PreferencePanes/Network.prefPane"
