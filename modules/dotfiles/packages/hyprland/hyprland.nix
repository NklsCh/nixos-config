{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    waybar
    rofi-wayland
    dunst
    libnotify
    swww
    networkmanagerapplet
  ];
}
