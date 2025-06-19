{ username, ... }:
{
  home-manager.users.${username} = _: {
    home.file = {
      ".config/backgrounds".source = ./wallpapers;
      ".config/nixlogo.svg".source = ./logo/nix-snowflake.svg;
    };
  };
}
