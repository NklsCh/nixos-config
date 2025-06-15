{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.contentcreation;
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
  options.contentcreation = {
    enable = mkEnableOption "Enable content creation tools";

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
