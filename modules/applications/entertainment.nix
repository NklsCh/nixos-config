{ pkgs, username, ... }:
{
  home-manager.users.${username} = {
    home.file = {
      ".local/share/applications/cider.desktop".text = ''
        [Desktop Entry]
        Name=Cider
        Exec=appimage-run /home/${username}/.local/share/Cider/Cider.AppImage
        Terminal=false
        Type=Application
        Icon=${pkgs.cider}/share/icons/hicolor/256x256/apps/cider.png
        Categories=Music;Entertainment;
      '';
    };
  };
}
