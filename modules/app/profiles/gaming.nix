{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    heroic-unwrapped
    lutris
    prismlauncher
    wine
  ];

  programs = {
    steam.enable = true;
  };
}
