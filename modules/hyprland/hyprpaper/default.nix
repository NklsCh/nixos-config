{
  username,
  ...
}:
{
  home-manager.users.${username} = _: {
    home.file = {
      ".config/hypr/hyprpaper.conf".text = ''
        preload = ~/.config/backgrounds/dark_wallpaper.jpg
        wallpaper = , ~/.config/backgrounds/dark_wallpaper.jpg
      '';
    };
  };
}
