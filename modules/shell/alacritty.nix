{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    alacritty
    clang
  ];

  home-manager.users.${username} = {
    home.file = {
      ".config/alacritty/alacritty.toml".source = ../config/alacritty.toml;
    };
  };
}
