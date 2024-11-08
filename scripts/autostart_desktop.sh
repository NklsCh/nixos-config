#!/usr/bin/env bash

# Start background services
gnome-keyring-daemon --start --components=secrets &
hyprpaper &
nm-applet --indicator &
ags &
hyprpanel &
dunst &

# Start applications
signal-desktop --start-in-tray &
localsend &
vesktop &
steam &

sleep 7
spotify &

# Wait for Steam to fully start
sleep 5
for window in $(hyprctl clients | grep -i "steam" | awk '{print $2}'); do
    hyprctl dispatch movetoworkspace 3,$window
done