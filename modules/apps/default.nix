{ pkgs, ... }:
{
  imports = [
    ./browsing
    #./ide/zed
    ./libreoffice
    ./obsidian
    ./vscode
  ];

  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "discord" ''
      exec ${(discord.override {withVencord=true;})}/bin/discord --enable-features=UseOzonePlatform --ozone-platform=wayland
    '')
    # (discord.override { withVencord = true; })
    (writeShellScriptBin "vesktop" ''
      exec ${vesktop}/bin/vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland
    '')
    anytype
  ];
}
