{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    teams-for-linux
  ];

  home-manager.users.${username} = {
    home.file.".config/teams-for-linux/config.json".source = ../../config/t4l.json;
  };
}
