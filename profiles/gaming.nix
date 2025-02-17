{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.system;
in
{
  config = mkIf cfg.profiles.gaming {
    environment.systemPackages = with pkgs; [
      heroic-unwrapped
      lutris
      prismlauncher
      wine
    ];

    programs = {
      steam.enable = true;
    };

    /*
      home-manager.users.${username} = {
        home.packages = with pkgs; [
          (nix-citizen.packages.${system}.star-citizen.override {
            gameScopeEnable = false;
            location = "/media/512-GB-SSD/Games/StarCitizen";
          })
        ];
      };
    */
  };
}
