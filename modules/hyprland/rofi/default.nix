{ username, ... }:
{
  home-manager.users.${username} = _: {
    home.file = {
      ".config/rofi/config.rasi".source = ./config.rasi;
    };
  };
}
