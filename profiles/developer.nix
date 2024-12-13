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
      zed-editor
      vscode
      #--- JetBrains ---#
      # jetbrains.phpstorm
      # jetbrains.webstorm
      # jetbrains.idea-ultimate
      #--- Tools ---#
      nodejs_latest
      gitkraken
      devenv
    ];
  };
}
