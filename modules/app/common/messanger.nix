{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    signal-desktop
    whatsapp-for-linux
  ];
}
