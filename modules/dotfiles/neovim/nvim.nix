{ config, pkgs, fetchFromGitHub, ... }:

let
  nvchad = pkgs.stdenv.mkDerivation {
    name = "nvchad";
    src = pkgs.fetchFromGitHub {
      owner = "NvChad";
      repo = "NvChad";
    };
  };
in
  {
    # ... other home manager configurations ...
    programs.neovim = {
      enable = true;
      package = nvchad;
    };
    xdg.configFile."nvim".source = nvchad;
  }
