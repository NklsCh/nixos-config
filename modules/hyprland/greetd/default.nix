{ pkgs, username, ... }:
{
  services.greetd = {
    enable = true;
    restart = false;
    settings = rec {
      initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --greeting 'Welcome to Wonderland' --asterisks --cmd Hyprland";
        user = username;
      };
      default_session = initial_session;
    };
  };
}
