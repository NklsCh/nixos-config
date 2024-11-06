{
  username,
  ...
}:
{
  home-manager.users.${username} = _: {
    home.file = {
      ".config/hypr/hyprlock.conf".source = ../../config/hyprlock.conf;
    };
  };
}
