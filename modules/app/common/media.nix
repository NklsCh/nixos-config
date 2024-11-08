{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vlc
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })

  ];
}
