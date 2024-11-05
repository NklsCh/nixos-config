{
  pkgs,
  ...
}:
{
  imports = [
    ./electron.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./rofi.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      grim
      gthumb
      hyprpanel
      hyprpaper
      libnotify
      nemo-with-extensions
      networkmanagerapplet
      pavucontrol
      playerctl
      pywal
      slurp
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
