{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    element-desktop
    signal-desktop
    teams-for-linux
    zoom-us
  ];
  home-manager.users.${username} = {
    home.file = {
      ".config/teams-for-linux/config.json".source = ../../config/t4l.json;
    };
  };
}
