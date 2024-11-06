{ pkgs, username, ... }:
{

  environment.systemPackages = [
    (pkgs.rofi-wayland.override (old: {
      plugins = (if (old ? plugins) then old.plugins else [ ]) ++ [ pkgs.rofi-emoji-wayland ];
    }))
  ];

  home-manager.users.${username} = _: {
    home.file = {
      ".config/rofi/config.rasi".source = ../../config/config.rasi;
    };
  };
}
