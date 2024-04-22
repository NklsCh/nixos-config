{ config, pkgs, ... }:
{
  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "/etc/nixos/hosts/Laptop/";
  };
}
