{ username, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnupg
    pinentry-curses
    pinentry-gnome3
  ];

  home-manager.users.${username} = _: {
    home.file = {
      ".gnupg/gpg-agent.conf".text = ''
        pinentry-program /run/current-system/sw/bin/pinentry-gnome3
        allow-loopback-pinentry
      '';
    };
  };
}
