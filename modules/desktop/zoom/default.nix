{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.zoom-us
    pkgs.cameractrls-gtk4
  ];
}
