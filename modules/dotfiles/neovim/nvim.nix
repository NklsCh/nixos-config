{ pkgs, ... }:

let
  nvchad = pkgs.stdenv.mkDerivation {
    name = "nvchad";
    src = pkgs.fetchFromGitHub {
      owner = "NvChad";
      repo = "NvChad";
      rev = "c7a4d4e3376b1684c1dd117d53e94480b2d7c9fe";
      sha256 = "14xskps1h07w2fwj78aw7sd6la0c8w2jwf5cwzsg67ikzr69iqmi";
    };
    installPhase = ''
      cp -r $src/* ~/.config/nvim
      ''
  };
in
  {
    # ... other home manager configurations ...
    programs.neovim = {
      enable = true;
      package = nvchad;
    };
  }
