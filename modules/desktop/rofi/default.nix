{ pkgs, username, ... }:
{
  environment.systemPackages = [
    (pkgs.rofi.override (old: {
      plugins = (if (old ? plugins) then old.plugins else [ ]) ++ [
        pkgs.rofi-emoji
        pkgs.rofi-calc
      ];
    }))
  ];

  home-manager.users.${username} = _: {
    home.file = {
      ".config/rofi/config.rasi".source = ./config.rasi;
    };
  };
}
