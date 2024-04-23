{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    waybar
    kitty
    rofi-wayland
    dunst
    libnotify
    swww
    networkmanagerapplet
  ];
}
