{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    lutris
    heroic
    prismlauncher
  ];

  programs = {
    steam.enable = true;
  };
}
