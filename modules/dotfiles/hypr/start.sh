#!/usr/bin/env bash

gnome-keyring-deamon --start --components=secrets &

sleep 5 &&

swww init &

# sleep 5 &&

swww img ~/Wallpapers/moon.jpg &

nm-applet --indicator &
waybar &
dunst
