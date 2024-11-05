{ pkgs, ... }:
{
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  environment.systemPackages = with pkgs; [ pulseaudio ];
}
