{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    protonmail-desktop
    protonvpn-gui
  ];
}
