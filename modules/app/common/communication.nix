{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    localsend
    signal-desktop
    whatsapp-for-linux
    zoom-us
  ];
}
