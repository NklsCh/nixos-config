{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    waybar
    rofi-wayland
    dunst
    libnotify
    swww
    networkmanagerapplet
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
