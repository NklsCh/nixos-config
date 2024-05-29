{ hyprland, pkgs, username, home-manager, system, ... }:
{
  imports = [
    ./config
    ./greetd
    ./rofi
    ./swaylock
    ./waybar
  ];

  home-manager.users.${username} = _: {
    gtk.enable = true;
    gtk.theme.name = "Dracula";
    gtk.theme.package = pkgs.dracula-theme;
  };

  environment = {
    sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      waybar
      cinnamon.nemo
      rofi-wayland
      dunst
      libnotify
      swww
      networkmanagerapplet
      grim
      slurp
      wl-clipboard
      xwaylandvideobridge
      brightnessctl
      sway
      swaylock-effects
    ];
  };

  programs.hyprland.enable = true;

  programs.dconf.enable = true;

  services.gnome = {
    gnome-keyring.enable = true;
  };

  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  xdg.portal = {
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
}
