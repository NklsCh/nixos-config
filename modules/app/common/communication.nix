{ pkgs, ... }:
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
}
