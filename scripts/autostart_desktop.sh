#!/usr/bin/env bash
gnome-keyring-deamon --start --components=secrets &

hyprpaper &
nm-applet --indicator &
ags &
hyprpanel &
dunst &

vesktop &
sleep 5
hyprctl dispatch movetoworkspace 4 $(hyprctl clients | grep vesktop | awk '{print $2}')

spotify &
sleep 5
hyprctl dispatch movetoworkspace 4 $(hyprctl clients | grep spotify | awk '{print $2}')


steam &
sleep 7
hyprctl dispatch movetoworkspace 3 $(hyprctl clients | grep steam | awk '{print $2}')
