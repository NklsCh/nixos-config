{ config, pkgs, ... }:

{
  imports = [
    ../../modules/dotfiles/git/git.nix
    ../../modules/dotfiles/oh-my-posh/ohmyposh.nix
    ../../modules/dotfiles/alacritty/alacritty.nix
    ../../modules/dotfiles/waybar/waybar.nix
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
    ".config/hypr".source = ../../modules/dotfiles/hypr;
    ".config/waybar".source = ../../modules/dotfiles/waybar/waybar.conf.d
    "Wallpapers".source = ../../modules/wallpapers;
  };

  # ========== Hyprland =========== #
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
  };

  # ========== Themeing ========== #
  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };
  };

  # ========== Session Variables =========== #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
