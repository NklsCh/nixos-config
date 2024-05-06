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
    libsForQt5.qt5.qtgraphicaleffects
    grim
    slurp
    wl-clipboard
    xwaylandvideobridge
    brightnessctl
    sway
    swaylock-effects
  ];

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };
}
