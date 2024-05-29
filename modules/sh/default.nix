{ username, ... }:
{
  home-manager.users.${username} = {
    home.file = {
      ".config/hypr/start.sh".source = ./start.sh;
    };
  };
}
