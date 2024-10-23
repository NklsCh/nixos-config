{
  pkgs,
  username,
  ...
}:
{
  home-manager.users.${username} = _: {
    gtk.enable = true;
    home.pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    gtk.theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    gtk.iconTheme = {
      package = pkgs.kora-icon-theme;
      name = "kora";
    };
  };
}
