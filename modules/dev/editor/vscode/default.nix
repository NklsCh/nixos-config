{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    gitkraken
    vscode
  ];
}
