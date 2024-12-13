{
  username,
  pkgs,
  ...
}:
let
  discordDesktop = import ../../config/dotdesktop/discord.nix { inherit pkgs; };
in
{
  home-manager.users.${username} = {
    home.file = {
      ".local/share/applications/Discord.desktop".text = discordDesktop.entry;
    };
  };

  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "vesktop" ''
      exec ${vesktop}/bin/vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland
    '')
  ];
}
