{ pkgs, ... }:

let
  nvchadSource = pkgs.fetchFromGitHub {
    owner = "NvChad";
    repo = "NvChad";
    rev = "c7a4d4e3376b1684c1dd117d53e94480b2d7c9fe";
    sha256 = "14xskps1h07w2fwj78aw7sd6la0c8w2jwf5cwzsg67ikzr69iqmi";
  };

  installNvChad = ''
    if [ ! -d "${HOME}/.config/nvim" ]; then
      cp -r "$nvchadSource"/* "${HOME}/.config/nvim"
    fi
  '';

in
  {
    # ... other home manager configurations ...
    programs.neovim = {
      enable = true;
      # Use xdg.configFile for a more Nix-idiomatic approach (optional)
      # xdg.configFile."nvim".source = nvchadSource;
      after = [ nvchad ];  # Ensure nvchad is built before Neovim
    };
  }

