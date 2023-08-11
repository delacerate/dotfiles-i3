#!/bin/bash 

# Launch polybar.
/home/delacerate/.config/polybar/launch.sh

# Get rid of that screen tearing.
# Unsure if this will make startup slower?...
#nvidia-force-comp-pipeline

# Start compositor. 
#picom -b
#start conky
#exec --no-startup-id conky -d

# Setup the arandr monitor layout AFTER compositor and BEFORE wallpaper.
~/.screenlayout/default_triple_monitor.sh 
# start gnome-keyring
exec --no-startup-id /usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh


# Set wallpaper AFTER compositor.
# feh --bg-fill ~/.wallpapers/IGN_Astronaut_Nord.png
feh --bg-fill ~/.wallpaper/wall.png
