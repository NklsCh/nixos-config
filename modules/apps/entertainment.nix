{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #-- Spotify --#
    spotify
    spotify-tray
    #-- Podcasts --#
    gnome-podcasts
  ];
}
