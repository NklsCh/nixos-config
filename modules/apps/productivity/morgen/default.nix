{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    morgen
  ];
}
