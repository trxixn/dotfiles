#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/style.sh" 2>/dev/null

CORE_COUNT=$(sysctl -n hw.logicalcpu)
CPU_PERCENT=$(ps -A -o %cpu | awk -v cores=$CORE_COUNT '{s+=$1} END {printf "%.0f", s/cores}')

if [[ -z "$CPU_PERCENT" || ! "$CPU_PERCENT" =~ ^[0-9]+$ ]]; then
  CPU_PERCENT=0
elif [ "$CPU_PERCENT" -gt 100 ]; then
  CPU_PERCENT=100
fi

# Top CPU process: PID %CPU COMM (e.g. 14907 77.8 OBS)
TOP_PROC=$(ps -Ao pid,%cpu,comm -r | head -n 2 | tail -n 1 | awk '{n=split($3,a,"/"); printf "%s %s %s", $1, $2, a[n]}')

# Floating point value between 0.00 and 1.00 for the graph
CPU_FLOAT=$(awk -v p="$CPU_PERCENT" 'BEGIN {printf "%.2f", p/100}')

if [ "$CPU_PERCENT" -ge 80 ]; then
  COLOR=$RED
else
  COLOR=$YELLOW
fi

sketchybar --set cpu.top label="$TOP_PROC" \
           --set cpu.percent label="${CPU_PERCENT}%" label.color=$COLOR \
           --push cpu.graph "$CPU_FLOAT"
