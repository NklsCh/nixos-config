{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    spotify
    spotify-tray
  ];
}
