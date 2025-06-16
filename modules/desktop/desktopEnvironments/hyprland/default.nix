{
  pkgs,
  ...
}:
{
  imports = [
    ./hyprland.nix
    ./hyprpanel.nix
    ./hyprpaper.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      grim
      gthumb
      hyprpaper
      libnotify
      nemo-with-extensions
      networkmanagerapplet
      pavucontrol
      playerctl
      pywal
      slurp
      wl-clipboard
      zenity
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  programs.uwsm = {
    enable = true;
  };

  programs.hyprlock = {
    enable = true;
  };
}
