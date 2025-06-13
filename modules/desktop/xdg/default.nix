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
    home.file = {
      ".config/user-dirs.dirs".text = ''
        XDG_DESKTOP_DIR="$HOME/Desktop"
        XDG_DOWNLOAD_DIR="$HOME/Downloads"
        XDG_TEMPLATES_DIR="$HOME/Templates"
        XDG_PUBLICSHARE_DIR="$HOME/Public"
        XDG_DOCUMENTS_DIR="$HOME/Documents"
        XDG_MUSIC_DIR="$HOME/Music"
        XDG_PICTURES_DIR="$HOME/Pictures"
        XDG_VIDEOS_DIR="$HOME/Videos"
      '';

      #--- Dirs to Create ---#
      "Desktop/create".text = "";
      "Downloads/create".text = "";
      "Templates/create".text = "";
      "Public/create".text = "";
      "Documents/create".text = "";
      "Music/create".text = "";
      "Pictures/create".text = "";
      "Videos/create".text = "";
    };
  };
}
