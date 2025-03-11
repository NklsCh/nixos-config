{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vlc
    # (obs-studio.override {
    #   cudaSupport = true;
    # })
  ];
}
