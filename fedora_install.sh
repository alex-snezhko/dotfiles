#!/usr/bin/env bash

echo 'Please make sure that you are running this script as a non-root user and inside the project root directory. Please also have an OpenWeatherMap API key ready.'
read -p 'Would you like to continue? (y/n)' should_continue

if [[ $should_continue != 'y' ]]; then
    echo 'Terminating the script.'
    exit 0
fi

echo -e 'Which config would you like to install?\n1) sway\n2) i3?'
read -p 'Selection (1 or 2): ' selection

if [[ $selection != '1' && $selection != '2' ]]; then
    echo 'Invalid selection. Exiting'
    exit 0
fi

echo 'Input your OpenWeatherMap API key.'
read -p 'API Key: ' apikey

# keep a record of packages needed to be installed
to_install='alacritty fish rofi pulseaudio-utils pavucontrol brightnessctl playerctl jetbrains-mono-fonts'
# directories from repo that should be copied to .config
to_copy='alacritty rofi'

if [[ $selection == '1' ]]; then
    to_install="$to_install sway waybar"
    to_copy="$to_copy sway waybar"
elif [[ $selection == '2' ]]; then
    to_install="$to_install i3-gaps polybar"
    to_copy="$to_copy i3-gaps polybar"
fi

sudo dnf install $to_install

# install fontawesome 6 icon fonts
curl https://use.fontawesome.com/releases/v6.1.1/fontawesome-free-6.1.1-desktop.zip -O
unzip -q fontawesome-free-6.1.1-desktop.zip
mkdir -p $HOME/.local/share/fonts/fontawesome-6
cp fontawesome-free-6.1.1-desktop/otfs/*.otf $HOME/.local/share/fonts/fontawesome-6
rm -r fontawesome-free-6.1.1-desktop.zip fontawesome-free-6.1.1-desktop

# copy all necessary configuration directories into their appropriate locations
cp -r $to_copy $HOME/.config

# put the OpenWeatherMap API key into the weather polling script
if [[ $selection == '1' ]]; then
    sed -i "s/KEY=\"\"/KEY=\"$apikey\"/g" $HOME/.config/waybar/openweathermap.sh
elif [[ $selection == '2' ]]; then
    sed -i "s/KEY=\"\"/KEY=\"$apikey\"/g" $HOME/.config/polybar/openweathermap-simple.sh
fi

echo -e '\n\nEnjoy!'
