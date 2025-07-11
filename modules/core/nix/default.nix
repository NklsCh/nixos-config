{ pkgs, username, ... }:
{
  imports = [
    ./btrfs.nix
    ./gc.nix
    ./settings.nix
  ];

  system = {
    extraSystemBuilderCmds = ''
      ln -sv ${pkgs.path} $out/nixpkgs
    '';
    stateVersion = "23.11";
  };

  nix = {
    package = pkgs.nixVersions.latest;
    nixPath = [ "nixpkgs=/run/current-system/nixpkgs/" ];
  };

  home-manager.users.${username} = {
    home.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = true;
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/cinnamon/desktop/applications/terminal" = {
        exec = "wezterm";
      };
    };
  };

  systemd.tpm2.enable = false;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.nh = {
    enable = true;
    flake = "/etc/nixos";
  };

  programs.nix-ld = {
    enable = true;
    libraries = (pkgs.steam-run.args.multiPkgs pkgs) ++ [
      pkgs.stdenv.cc.cc.lib
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-32.3.3"
    ];
  };
}
