{ username, ... }:
{
  home-manager.users.${username} = {
    home.file = {
      ".config/electron-flags.conf".source = ../../config/electron-flags.conf;
    };
  };
}
