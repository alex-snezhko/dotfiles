#!/usr/bin/env bash

if [[ "$1" = "left" || "$1" = "right" ]]; then
    window_start=$(xwininfo -id $(xdotool getactivewindow) | grep 'Absolute upper-left X' | cut -f2 -d':')
    window_width=$(xwininfo -id $(xdotool getactivewindow) | grep 'Width' | cut -f2 -d':')
    window_end=$((window_start + window_width))
    screen_end=$(($(xdpyinfo | awk '/dimensions/{print $2}' | cut -f1 -d'x') - 10))
    if ((window_end > screen_end)); then
        #modify=$([[ "$1" == "left" ]] && echo "grow" || echo "shrink")
    elif ((window_start < 10)); then
        if [[ "$1" == "left" ]]; then
            modify=shrink
        else
            modify=grow
        fi
        #modify=$([[ "$1" == "left" ]] && echo "shrink" || echo "grow")
    fi
elif [[ "$1" = "up" || "$1" = "down" ]]; then
    window_start=$(xwininfo -id $(xdotool getactivewindow) | grep 'Absolute upper-left Y' | cut -f2 -d':')
    window_height=$(xwininfo -id $(xdotool getactivewindow) | grep 'Height' | cut -f2 -d':')
    window_end=$((window_start + window_height))
    screen_end=$(($(xdpyinfo | awk '/dimensions/{print $2}' | cut -f2 -d'x') - 10))
    if ((window_end > screen_end)); then
        modify=$([[ "$1" == "up" ]] && echo "grow" || echo "shrink")
    elif ((window_start < 10)); then
        modify=$([[ "$1" == "up" ]] && echo "shrink" || echo "grow")
    fi
fi

if [ -n modify ]; then
    i3-msg resize "$modify" "$1" 5px or 5 ppt
fi