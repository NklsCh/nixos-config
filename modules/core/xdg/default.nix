{ pkgs, ... }:
{
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
