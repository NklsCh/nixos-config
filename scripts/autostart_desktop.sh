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
whatsapp-for-linux &
localsend &
vesktop &
steam &

sleep 7
spotify &
