{ pkgs, ... }:
{
  imports = [
    ./anytype
    ./browsing
    ./discord
    ./ide/zed
    ./libreoffice
    ./obsidian
    ./proton
    ./spotify
    ./vscode
  ];
}
