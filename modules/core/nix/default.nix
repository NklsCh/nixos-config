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
    extraOptions = ''
      extra-substituters = https://denenv.cachnix.org;
      extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=;
    '';
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
