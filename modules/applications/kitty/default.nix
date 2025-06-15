{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    kitty
  ];

  home-manager.users.${username} = {
    home.file = {
      ".config/kitty/kitty.conf".source = ./kitty.conf;
    };
  };
}
