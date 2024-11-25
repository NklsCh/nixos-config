{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wine
    lutris
    heroic-unwrapped
    prismlauncher
  ];

  programs = {
    steam.enable = true;
  };
}
