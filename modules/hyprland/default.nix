{ home-manager, ... }:
{
  imports = [
    ./waybar
    ./swaylock
    ./rofi
    ./config
  ];
}
