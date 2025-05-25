{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome-calendar
  ];
}
