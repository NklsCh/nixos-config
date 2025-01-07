{ pkgs, ... }:
{
  # sound.enable = true;
  services.pulseaudio.enable = false;
  environment.systemPackages = with pkgs; [ pulseaudio ];
}
