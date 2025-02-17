{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #--- Editors ---#
    vscode
    #--- Tools ---#
    gitkraken
    devenv
  ];
}
