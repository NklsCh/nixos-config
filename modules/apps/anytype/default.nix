{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    anytype
  ];
}
