{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vlc
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        obs-backgroundremoval
        obs-pipewire-audio-capture
        wlrobs
      ];
    })

  ];
}
