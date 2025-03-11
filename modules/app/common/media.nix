{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vlc
    # (obs-studio.override {
    #   cudaSupport = true;
    # })
    (wrapOBS {
      plugins = with obs-studio-plugins; [
        wlrobs
        obs-vaapi
        obs-vkcapture
        obs-pipewire-audio-capture
      ];
    })
  ];
}
