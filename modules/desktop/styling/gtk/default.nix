{
  pkgs,
  username,
  ...
}:
{
  home-manager.users.${username} = _: {
    home.pointerCursor = {
      package = pkgs.adwaita-icon-theme; # pkgs.bibata-cursors;
      name = "Adwaita"; # "Bibata-Modern-Ice";
    };
    gtk = {
      enable = true;
      theme = {
        package = pkgs.dracula-theme;
        name = "Dracula";
      };
      iconTheme = {
        package = pkgs.kora-icon-theme;
        name = "kora";
      };
      cursorTheme = {
        package = pkgs.adwaita-icon-theme; # pkgs.bibata-cursors;
        name = "Adwaita"; # "Bibata-Modern-Ice";
      };
    };
  };
}
