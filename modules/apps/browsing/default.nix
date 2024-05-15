{ pkgs, home-manager, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
  };
}
