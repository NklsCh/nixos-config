{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    waybar
    rofi-wayland
    dunst
    libnotify
    swww
    networkmanagerapplet
    libsForQt5.dolphin
    grim
    slurp
    wl-clipboard
    xwaylandvideobridge
    brightnessctl
  ];
}
