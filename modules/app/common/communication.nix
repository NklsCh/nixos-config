{ pkgs, username, ... }:
let
  protonMailDesktop = import ../../config/dotdesktop/proton-mail.nix { inherit pkgs; };
in
{
  environment.systemPackages = with pkgs; [
    element-desktop
    localsend
    session-desktop
    signal-desktop
    teams-for-linux
    tutanota-desktop
    whatsapp-for-linux
    zoom-us
  ];
  home-manager.users.${username} = {
    home.file = {
      ".local/share/applications/proton-mail.desktop".text = protonMailDesktop.entry;
      ".config/teams-for-linux/config.json".source = ../../config/t4l.json;
    };
  };
}
