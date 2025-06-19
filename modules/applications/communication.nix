{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    element-desktop
    signal-desktop
    whatsapp-for-linux
    zoom-us
  ];
}
