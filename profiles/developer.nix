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
  config = mkIf cfg.profiles.developer {
    environment.systemPackages = with pkgs; [
      #--- Editors ---#
      vscode
      #--- Tools ---#
      nodejs_latest
      gitkraken
      devenv
    ];
  };
}
