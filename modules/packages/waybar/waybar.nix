{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pavucontrol
    sway
    wlogout
    swaylock-effects
  ];
}
