{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.gaming;
  defaultPackages = with pkgs; [
    (discord.override {
      withOpenASAR = false;
      withVencord = true;
    })
    heroic-unwrapped
    lutris
    prismlauncher
    wine
  ];

in
{
  options.gaming = {
    enable = mkEnableOption "Gaming profile with various gaming tools";

    optionalPackages = mkOption {
      type = types.listOf types.package;
      default = [ ];
      example = [
        pkgs.discord
      ];
      description = "List of additional optional packages for gaming";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = defaultPackages ++ cfg.optionalPackages;

    programs = {
      steam.enable = true;
      gamemode.enable = true;
    };

    hardware.steam-hardware.enable = true;
  };
}
