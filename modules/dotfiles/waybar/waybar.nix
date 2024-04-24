{ config, pkgs, lib, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      window#waybar {
        background: transparent;
        border-bottom: none;
      }
    '';

    # Config
    
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
      "hyprland/workspaces" = {
        on-click = "activate";
        active-only = false;
        all-outputs = true;
        format = "{}";
        persistent-workspaces = { 
          "*" = 5;
        };
      };
    }];
  };
}
