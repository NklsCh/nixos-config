#!/usr/bin/env bash

gnome-keyring-deamon --start --components=secrets &

swww init &

sleep 0.5 &&

swww img ~/.config/backgrounds/wallpaper_reddit.png &

nm-applet --indicator &
waybar &
dunst
