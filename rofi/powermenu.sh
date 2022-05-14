#!/usr/bin/env bash

# Options
# shutdown=""
shutdown=""
reboot=""
logout=""
lock=""
suspend=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$logout\n$lock"

chosen="$(echo -e "$options" | rofi -theme $HOME/.config/rofi/powermenu.rasi -dmenu)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        swaylock
        ;;
    $logout)
        swaymsg exit
        ;;
esac