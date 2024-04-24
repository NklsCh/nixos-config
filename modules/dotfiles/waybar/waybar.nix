{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      height = 16;
      margin-left = 0;
      margin-right = 0;
      spacing = 0;
      modules-center = [ "hyprland/workspaces" ];
      modules-right = [ 
        "pulseaudio"
        "bluetooth"
        "battery"
        "network"
        "group/hardware"
        "idle_inhibitor"
        "tray"
        "clock"
      ];
    }];
  };
}
