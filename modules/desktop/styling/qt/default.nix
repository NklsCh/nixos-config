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
        package = pkgs.catppuccin-qt5ct;
        name = "frappe";
      };
    };
  };
}
