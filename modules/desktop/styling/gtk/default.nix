{
  pkgs,
  username,
  ...
}:
{
  home-manager.users.${username} = _: {
    home.pointerCursor = {
      package = pkgs.bibata-cursors; # pkgs.adwaita-icon-theme;
      name = "Bibata-Modern-Ice"; # "Adwaita";
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
        package = pkgs.bibata-cursors; # pkgs.adwaita-icon-theme;
        name = "Bibata-Modern-Ice"; # "Adwaita";
      };
    };
  };
}
