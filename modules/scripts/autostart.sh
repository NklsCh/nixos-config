#!/usr/bin/env bash
gnome-keyring-deamon --start --components=secrets &

swww-deamon &
sleep 0.5 &&
swww img ~/.config/backgrounds/mountains.jpg &

nm-applet --indicator &
# waybar &
ags &
hyprpanel &
dunst &

spotify &
sleep 5
hyprctl dispatch movetoworkspace 4 $(hyprctl clients | grep spotify | awk '{print $2}')

vesktop &
sleep 5
hyprctl dispatch movetoworkspace 4 $(hyprctl clients | grep vesktop | awk '{print $2}')


steam &
sleep 7
hyprctl dispatch movetoworkspace 3 $(hyprctl clients | grep steam | awk '{print $2}')
