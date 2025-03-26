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
      gtk3.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
      gtk4.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
    };
  };
}
