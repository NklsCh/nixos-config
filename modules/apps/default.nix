{ pkgs, ... }:
{
  imports = [
    ./browsing
    ./libreoffice
    ./vscode
  ];

  environment.systemPackages = with pkgs; [
    discord
  ];
}
