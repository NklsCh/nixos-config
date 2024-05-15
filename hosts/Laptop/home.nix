{ config, pkgs, ... }:

{
  imports = [

    # ---- Core / Terminal ---- #
    ../../modules/core/terminal
    # ---- Core / Programs ---- #
    ../../modules/core/programms
    # ---- Hyprland ---- #
    ../../modules/hyprland
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

    # ---- Hyprland Configs ---- #
    ".config/sh/start.sh".source = ../../modules/sh/start.sh;
    ".config/wlogoutimages".source = ../../assets/wlogout;

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
  dconf.settings = {
    "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
    };
  };
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita-dark";
    };
  };
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = {
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita-dark";
    };
  };

  # ---- Session Variables ---- #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # ---- Home-manager ---- #
  programs.home-manager.enable = true;
}
