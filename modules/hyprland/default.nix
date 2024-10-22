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
      nemo-with-extensions
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
      gthumb

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
  security.pam.services.hyprlock = {
    text = ''
      auth      required  pam_gnome_keyring.so
      session   required  pam_gnome_keyring.so auto_start
    '';
  };

  xdg = {
    mime = {
      defaultApplications = {
        "inode/directory" = [ "nemo.desktop" ];
        "image/png" = [ "gthumb.desktop" ];
        "image/jpeg" = [ "gthumb.desktop" ];
        "image/jpg" = [ "gthumb.desktop" ];
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
