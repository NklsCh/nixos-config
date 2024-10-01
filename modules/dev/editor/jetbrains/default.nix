{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.phpstorm
    jetbrains.webstorm
    jetbrains.idea-ultimate
  ];
}
