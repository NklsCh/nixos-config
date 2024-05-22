{ config, pkgs, ... }:
{
  home.file = {
    ".config/neofetch/config.conf".source = ./config.conf;
  };
}
