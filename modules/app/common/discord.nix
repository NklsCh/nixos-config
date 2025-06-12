{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    (discord.override {
      withOpenASAR = false;
      withVencord = true;
    })
  ];
  /*
    home-manager.users.${username} = {
      home.file = {
        ".local/share/applications/Discord.desktop".text = ''
          [Desktop Entry]
          Name=Discord
          Exec=discord --ozone-platform=x11
          Terminal=false
          Type=Application
          Icon=${pkgs.discord}/share/pixmaps/discord.png
          Categories=Network;Chat;
        '';
      };
    };
  */
}
