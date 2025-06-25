{
  username,
  wallpaper,
  ...
}:
{
  home-manager.users.${username} = _: {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ "/home/${username}/.config/backgrounds/${wallpaper}" ];
        wallpaper = [
          " , ~/.config/backgrounds/${wallpaper}"
        ];
      };
    };
  };
}
