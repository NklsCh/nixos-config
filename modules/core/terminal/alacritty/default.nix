{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [ alacritty ];

  home-manager.users.${username} = {
    home.file = {
      ".config/alacritty/alacritty.toml".source = ./alacritty.toml;
    };
  };
}
