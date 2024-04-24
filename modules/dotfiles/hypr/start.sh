#!/usr/bin/env bash

gnome-keyring-deamon --start --components=secrets &

swww init &&
swww img ~/Wallpapers/moon.jpg &

nm-applet --indicator &
waybar &
dunst
