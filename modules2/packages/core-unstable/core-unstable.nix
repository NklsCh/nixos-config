{ pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    nh
    nix-output-monitor
    warp-terminal
  ];
}
