#!/bin/bash

# Path to your wallpaper directory
WALLPAPER_DIR=~/.wallpaper

# Get the current wallpaper filename from a file (if it exists)
CURRENT_WALLPAPER_FILE=~/.current_wallpaper
if [[ -f $CURRENT_WALLPAPER_FILE ]]; then
    CURRENT_WALLPAPER=$(cat $CURRENT_WALLPAPER_FILE)
else
    CURRENT_WALLPAPER=""
fi

# Get the list of wallpaper files
WALLPAPER_FILES=($(ls $WALLPAPER_DIR))

# Find the index of the current wallpaper in the array
CURRENT_INDEX=-1
for i in "${!WALLPAPER_FILES[@]}"; do
    if [[ "${WALLPAPER_FILES[i]}" == "$CURRENT_WALLPAPER" ]]; then
        CURRENT_INDEX=$i
        break
    fi
done

# Calculate the index of the next wallpaper
NEXT_INDEX=$(( ($CURRENT_INDEX + 1) % ${#WALLPAPER_FILES[@]} ))

# Set the next wallpaper using feh
feh --bg-fill "$WALLPAPER_DIR/${WALLPAPER_FILES[NEXT_INDEX]}"

# Save the next wallpaper filename to the file
echo "${WALLPAPER_FILES[NEXT_INDEX]}" > $CURRENT_WALLPAPER_FILE

# Simulate F5 key press to refresh i3 session
xdotool key F5

