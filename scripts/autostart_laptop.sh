#!/usr/bin/env bash
gnome-keyring-deamon --start --components=secrets &

hyprpanel &
nm-applet --indicator &
ags &
hyprpanel &
dunst &
