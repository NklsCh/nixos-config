{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    element-desktop-wayland
    localsend
    session-desktop
    signal-desktop
    whatsapp-for-linux
    zoom-us
  ];
}
