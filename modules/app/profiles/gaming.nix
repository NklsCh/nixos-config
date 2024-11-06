{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wine
    lutris
    heroic
    prismlauncher
  ];

  programs = {
    steam.enable = true;
  };
}
