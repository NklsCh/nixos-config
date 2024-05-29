{ pkgs, home-manager, username, ... }:
{
  home-manager.users.${username} = {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;
    };
  };
}
