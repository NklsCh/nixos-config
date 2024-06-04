{ pkgs, username, ... }:
{
  imports = [ ./nh ];

  system = {
    extraSystemBuilderCmds = ''
      ln -sv ${pkgs.path} $out/nixpkgs
    '';
    stateVersion = "23.11";
  };

  nix = {
    package = pkgs.nixVersions.nix_2_21;
    nixPath = [ "nixpkgs=/run/current-system/nixpkgs/" ];
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  home-manager.users.${username} = {
    home.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
