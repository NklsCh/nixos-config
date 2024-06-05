{ pkgs, ... }:
{
  imports = [
    ./anytype
    ./browsing
    ./discord
    ./ide/zed
    ./libreoffice
    ./obsidian
    ./spotify
    ./vscode
  ];
}
