{ hyprland, hyprlock, pkgs, ... }:
{
  imports = [
    ./config
    ./electron
    ./greetd
    ./rofi
  ];

  environment = {
    sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      brightnessctl
      grim
      gthumb
      hyprpanel
      libnotify
      nemo-with-extensions
      networkmanagerapplet
      pavucontrol
      playerctl
      pywal
      rofi-wayland
      slurp
      swww
      wl-clipboard
      xwaylandvideobridge
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.hyprlock = {
    enable = true;
  };

  programs.dconf.enable = true;
}
