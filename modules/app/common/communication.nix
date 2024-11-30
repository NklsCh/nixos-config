{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    element-desktop
    localsend
    session-desktop
    signal-desktop
    tutanota-desktop
    whatsapp-for-linux
    zoom-us
  ];
}
