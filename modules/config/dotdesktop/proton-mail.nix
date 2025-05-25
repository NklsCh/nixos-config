{ pkgs }:
{
  entry = ''
    [Desktop Entry]
    Name=Proton Mail
    Exec=proton-mail --ozone-platform=x11
    Terminal=false
    Type=Application
    Icon=${pkgs.protonmail-desktop}/share/pixmaps/proton-mail.png
    Categories=Network;Email;
  '';
}
