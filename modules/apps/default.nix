{ pkgs, ... }:
{
  imports = [
    ./anytype
    ./browsing
    ./discord
    ./ide/zed
    ./libreoffice
    ./nodejs
    ./obsidian
    ./vscode
  ];
}
