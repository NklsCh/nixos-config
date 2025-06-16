#!/usr/bin/env bash

# Start background services
gnome-keyring-daemon --start --components=ssh,secrets &
hyprpaper &
nm-applet --indicator &
ags &
dunst &
