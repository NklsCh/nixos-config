{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    element-desktop
    localsend
    session-desktop
    signal-desktop
    whatsapp-for-linux
    zoom-us
  ];
}
