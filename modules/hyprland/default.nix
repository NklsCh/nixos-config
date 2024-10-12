{ hyprland, hyprlock, pkgs, username, home-manager, system, ... }:
{
  imports = [
    ./config
    ./electron
    ./greetd
    ./rofi
  ];

  home-manager.users.${username} = _: {
    gtk.enable = true;
    home.pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    gtk.theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    gtk.iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    qt = {
      enable = true;
      platformTheme.name = "adwaita";
      style = {
        package = pkgs.dracula-theme;
        name = "Dracula";
      };
    };
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  environment = {
    sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      nemo
      rofi-wayland
      pavucontrol
      libnotify
      playerctl
      swww
      networkmanagerapplet
      grim
      slurp
      wl-clipboard
      xwaylandvideobridge
      brightnessctl
      pywal

      # Hyprpanel
      hyprpanel
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.hyprlock = {
    enable = true;
  };

  programs.dconf.enable = true;

  services.gnome = {
    gnome-keyring.enable = true;
  };

  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.hyprlock = {};

  xdg = {
    mime = {
      defaultApplications = {
        "inode/directory" = [ "nemo.desktop" ];
      };
    };
    portal = {
      enable = true;
      config = {
        common = {
          default = [
            "xdph"
            "gtk"
          ];
          "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
          "org.freedesktop.portal.FileChooser" = [ "xdg-desktop-portal-gtk" ];
        };
      };
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    };
  };
}
