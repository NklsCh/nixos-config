{
  pkgs,
  username,
  ...
}:
{
  home-manager.users.${username} = _: {
    qt = {
      enable = true;
      platformTheme.name = "adwaita";
      style = {
        package = pkgs.dracula-theme;
        name = "Dracula";
      };
    };
  };
}
