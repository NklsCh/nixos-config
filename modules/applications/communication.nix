{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    element-desktop
    signal-desktop
    teamspeak6-client
    whatsapp-for-linux
    zoom-us
  ];
}
