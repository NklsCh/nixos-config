{ config, pkgs, ... }:

{
  imports = [

    # ---- Core / Terminal ---- #
    ../../modules/core/terminal
    # ---- Core / Programs ---- #
    ../../modules/core/programms
  ];

  # ---- User config ---- #
  home.username = "choinowski";
  home.homeDirectory = "/home/choinowski";

  # ---- Home-manager version ---- #
  home.stateVersion = "23.11";

  # ---- Packages to install ---- # 
  home.packages = [
    pkgs.alacritty
    pkgs.git-credential-manager
  ];

  # ---- Package Configs ---- #
  home.file = {
    ".poshThemes".source = ../../modules/.poshThemes;

    # ---- Hyprland Configs ---- #
    ".config/hypr".source = ../../modules/hyprland/config;
    ".config/waybar".source = ../../modules/hyprland/waybar;
    ".config/swaylock".source = ../../modules/hyprland/swaylock;
    ".config/wlogout".source = ../../modules/hyprland/wlogout;
    ".config/rofi".source = ../../modules/hyprland/rofi;

    # ---- Wallpapers ---- #
    "Wallpapers".source = ../../assets/wallpapers;
  };

  # ---- Hyprland ---- #
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
  };

  # ---- Theming ---- #
  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };
  };

  # ---- Session Variables ---- #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # ---- Home-manager ---- #
  programs.home-manager.enable = true;
}
