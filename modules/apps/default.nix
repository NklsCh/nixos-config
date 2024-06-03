{ pkgs, ... }:
{
  imports = [
    ./browsing
    ./libreoffice
    ./obsidian
    ./vscode
  ];

  environment.systemPackages = with pkgs; [
    discord
  ];
}
