{
  username,
  ...
}:
{
  home-manager.users.${username} = _: {
    home.file = {
      ".config/hypr/hyprpaper.conf".source = ./config/hyprpaper.conf;
    };
  };
}
