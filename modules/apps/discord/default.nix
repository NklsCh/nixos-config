{ home-manager, username, pkgs, ... }:
{

  home-manager.users.${username} = {
    home.file = {
      ".local/share/applications/Discord.desktop".text = ''
        [Desktop Entry]
        Name=Discord
        Comment=Discord Client
        Exec=vesktop
        Icon=discord
        Terminal=false
        Type=Application
        Categories=Network;InstantMessaging;
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "discord" ''
      exec ${(discord.override {withVencord=true;})}/bin/discord --enable-features=UseOzonePlatform --ozone-platform=wayland
    '')
    # (discord.override { withVencord = true; })
    (writeShellScriptBin "vesktop" ''
      exec ${vesktop}/bin/vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland
    '')
  ];
}
