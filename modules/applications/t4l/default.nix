{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    teams-for-linux
  ];
  home-manager.users.${username} = {
    home.file = {
      ".config/teams-for-linux/config.json".source = ./t4l.json;
    };
  };
}
