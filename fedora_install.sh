#!/usr/bin/env bash

echo 'Which config would you like to install?\n1) sway\n2) i3?'
read -p "Selection: " selection

if [[ $selection != '1' && $selection != '2' ]]; then
    echo 'Invalid selection. Exiting'
    exit 0
fi

sudo dnf install alacritty fish rofi pavucontrol brightnessctl playerctl jetbrains-mono-fonts fontawesome-fonts helix
cp -r alacritty helix rofi $HOME/.config
chmod +x $HOME/.config/rofi/powermenu.sh

if [[ $selection == '1' ]]; then
    sudo dnf install sway waybar
    cp -r sway waybar $HOME/.config
    chmod +x $HOME/.config/sway/resize-window.sh
    chmod +x $HOME/.config/waybar/mediaplayer.sh
    chmod +x $HOME/.config/waybar/openweathermap.sh
elif [[ $selection == '2' ]]; then
    sudo dnf install i3-gaps polybar
    cp -r i3 polybar $HOME/.config
    chmod +x $HOME/.config/resize-window.sh
fi

echo 'Enjoy!'
