{ home-manager, username, ... }:
{
  home-manager.users.${username} = {
    home.file = {
      ".config/electron-flags.conf".text = ''
        --enable-features=UseOzonePlatform
        --ozone-platform=wayland
      '';
    };
  };
}
