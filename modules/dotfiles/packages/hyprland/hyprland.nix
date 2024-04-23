{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprland
    waybar
    kitty
    rofi-wayland
    dunst
    libnotify
    swww
  ];
}
