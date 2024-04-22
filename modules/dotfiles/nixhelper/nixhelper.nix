{ config, pkgs, ... }:
{
  programs.nh = {
    enable = true;
    clean.enable = true;
    hostname = "Laptop";
    flake = "/etc/nixos";
  };
}
