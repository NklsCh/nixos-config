{ config, pkgs, pkgs-unstable, ... }:
{
  pkgs-unstable.nh = {
    enable = true;
    clean.enable = true;
    flake = "/etc/nixos";
  };
}
