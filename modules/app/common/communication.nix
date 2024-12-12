{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    element-desktop
    localsend
    protonmail-desktop
    session-desktop
    signal-desktop
    whatsapp-for-linux
    zoom-us
  ];
  home-manager.users.${username} = {
    home.file.".local/share/applications/proton-mail.desktop".text = ''
      [Desktop Entry]
      Name=Proton Mail
      Exec=proton-mail --ozone-platform=x11
      Terminal=false
      Type=Application
      Icon=${pkgs.protonmail-desktop}/share/pixmaps/proton-mail.png
      Categories=Network;Email;
    '';
  };
}
