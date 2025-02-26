{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    anytype
    morgen
    obsidian
  ];
}
