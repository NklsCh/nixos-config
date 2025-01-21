{ username, ... }:
{
  home-manager.users.${username} = _: {
    home.file = {
      ".config/backgrounds".source = ./wallpapers;
      "nixlogo.svg".source = ./logo/nix-snowflake.svg;
    };
  };
}
