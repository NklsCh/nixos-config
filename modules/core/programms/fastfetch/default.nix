{ username, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ fastfetch ];

  home-manager.users.${username} = _: {
    home.file = {
      ".config/fastfetch/config.jsonc".source = ./config.jsonc;
    };
  };
}
