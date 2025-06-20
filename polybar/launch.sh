#!/bin/bash
pkill -x polybar

# for multi-monitor
if type "xrandr" >/dev/null; then
    for m in $(xrandr -query | awk '/ connected/{print $1}'); do
        MONITOR=$m polybar --reload mybar &
    done
else
    polybar --reload mybar &
fi
