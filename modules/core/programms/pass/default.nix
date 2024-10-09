{ username, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    pass-wayland
    gnupg
    pinentry-curses
    passExtensions.pass-otp
  ];
  home-manager.users.${username} = _: {
    home.file = {
      ".gnupg/gpg-agent.conf".text = ''
        pinentry-program /run/current-system/sw/bin/pinentry-curses
      '';
    };
  };
}
