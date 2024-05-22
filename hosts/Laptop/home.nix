{ config, pkgs, ... }:

{
  imports = [

    # ---- Modules ---- #
    ../../modules
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

  # ---- Theming ---- #
  dconf.settings = {
    "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
    };
  };
  gtk = {
    enable = true;
    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
  };

  # ---- Session Variables ---- #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # ---- Home-manager ---- #
  programs.home-manager.enable = true;
}
