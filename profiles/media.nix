{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.media;
  defaultPackages = with pkgs; [
    (wrapOBS {
      plugins = with obs-studio-plugins; [
        wlrobs
        obs-vaapi
        obs-vkcapture
        obs-pipewire-audio-capture
      ];
    })
    davinci-resolve
  ];
in
{
  options.media = {
    enable = mkEnableOption "Enable media tools";

    optionalPackages = mkOption {
      type = types.listOf types.package;
      default = [ ];
      example = [
        pkgs.davinci-resolve-studio
      ];
      description = "List of optional packages to install alongside the default ones.";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = defaultPackages ++ cfg.optionalPackages;
  };
}
