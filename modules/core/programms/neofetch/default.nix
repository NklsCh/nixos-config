{ config, pkgs, ... }:
{
  home.file = {
    ".config/neofetch/config.conf".source = ./config.conf;
    ".config/neofetch/image.svg".source = builtins.fetchurl {
      url = https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake-colours.svg;
      sha256 = "1cifj774r4z4m856fva1mamnpnhsjl44kw3asklrc57824f5lyz3";
    };
  };
}
