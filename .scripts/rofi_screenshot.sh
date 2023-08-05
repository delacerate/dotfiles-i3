#!/bin/bash

# Capture the screenshot
scrot "$HOME/Pictures/screenshot_%Y-%m-%d-%H-%M-%S.png"

# Display a notification
notify-send "Screenshot captured"
