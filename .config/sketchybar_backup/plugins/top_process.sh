#!/bin/bash

TOP_PROC=$(ps axo pid,comm,%cpu,args | sort -nrk 3 | head -n 1)
PID=$(echo "$TOP_PROC" | awk '{print $1}')
CPU=$(echo "$TOP_PROC" | awk '{print $3}')
COMMAND=$(echo "$TOP_PROC" | awk '{$1=$2=$3=""; print $0}' | sed 's/^[ \t]*//')

# Simplify command name (basename)
NAME=$(basename "$COMMAND")
# Remove arguments if any (simplified approach)
NAME=${NAME%% *}

# Format: PID NAME CPU%
LABEL="$PID $NAME $CPU%"

sketchybar --set $NAME label="$LABEL"
