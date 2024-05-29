{ pkgs, username, ... }:
{
  system = {
    extraSystemBuilderCmds = ''
      ln -sv ${pkgs.path} $out/nixpkgs
    '';
    stateVersion = "23.11";
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
