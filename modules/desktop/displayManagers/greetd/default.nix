{ pkgs, username, ... }:
{
  services.greetd = {
    enable = false;
    restart = false;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --greeting 'Welcome to Wonderland' --asterisks --cmd 'uwsm start hyprland-uwsm.desktop'";
        user = username;
      };
    };
  };
}
