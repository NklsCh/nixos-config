{ config, pkgs, ... }:

{
  imports = [
    ../../modules/dotfiles/git/git.nix
    ../../modules/dotfiles/oh-my-posh/ohmyposh.nix
    ../../modules/dotfiles/alacritty/alacritty.nix
  ];

  # ========== User config =========== #
  home.username = "choinowski";
  home.homeDirectory = "/home/choinowski";

  # ========== Home-manager version =========== #
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # ========== Packages to install =========== # 
  home.packages = [
    pkgs.alacritty
    pkgs.neovim
    pkgs.git-credential-manager
  ];

  # ========== Package Configs =========== #
  home.file = {
    ".bashrc".source = ../../modules/dotfiles/.bashrc;
    ".poshThemes".source = ../../modules/dotfiles/.poshThemes;
  };

  # ========== Session Variables =========== #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
