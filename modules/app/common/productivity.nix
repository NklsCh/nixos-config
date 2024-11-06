{ username, pkgs, ... }:
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [ obsidian ];
  };
  environment.systemPackages = with pkgs; [
    anytype
  ];

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];
}
