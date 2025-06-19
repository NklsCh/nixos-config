{
  pkgs,
  username,
  ...
}:
{
  xdg = {
    mime = {
      defaultApplications = {
        "application/x-gnome-saved-search" = [ "nemo.desktop" ];
        "image/jpeg" = [ "gthumb.desktop" ];
        "image/jpg" = [ "gthumb.desktop" ];
        "image/png" = [ "gthumb.desktop" ];
        "inode/directory" = [ "nemo.desktop" ];
        "video/avi" = [ "vlc.desktop" ];
        "video/mp4" = [ "vlc.desktop" ];
        "video/x-matroska" = [ "vlc.desktop" ];
      };
    };
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
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

  home-manager.users.${username} = _: {
    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
