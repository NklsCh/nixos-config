{
  username,
  ...
}:
{
  home-manager.users.${username} = _: {
    /*
      home.file = {
        ".config/hypr/hyprpaper.conf".source = ./config/hyprpaper.conf;
      };
    */
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ "/home/${username}/.config/backgrounds/dark_wallpaper.jpg" ];
        wallpaper = [
          " , ~/.config/backgrounds/dark_wallpaper.jpg"
        ];
      };
    };
  };
}
