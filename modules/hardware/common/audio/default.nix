{ ... }:
{
  imports = [
    ./pipewire.nix
    ./pulseaudio.nix
  ];

  security.rtkit.enable = true;
}
