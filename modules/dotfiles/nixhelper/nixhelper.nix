{ config, pkgs, pkgs-unstable, ... }:

let 
  nh = pkgs-unstable.nh;
in

with pkgs;
  {
    programs.nh = {
      enable = true;
      clean.enable = true;
      flake = "/etc/nixos";
    };
  }
