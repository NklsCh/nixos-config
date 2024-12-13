{ pkgs }:
{
  entry = ''
    [Desktop Entry]
    Name=Discord
    Comment=Discord Client
    Exec=vesktop --disable-features=WebRtcAllowInputVolumeAdjustment
    Icon=discord
    Terminal=false
    Type=Application
    Categories=Network;InstantMessaging;
  '';
}
