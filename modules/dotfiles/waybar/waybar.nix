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
    }];
  };
}
