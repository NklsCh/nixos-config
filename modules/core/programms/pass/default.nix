{ username, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pass
    gnupg
    pinentry-curses
    passExtensions.pass-otp
    qtpass
  ];

  environment.variables = {
    PASSWORD_STORE_ENABLE_EXTENSIONS = "true";
  };

  home-manager.users.${username} = _: {
    home.file = {
      ".gnupg/gpg-agent.conf".text = ''
        pinentry-program /run/current-system/sw/bin/pinentry-tty
        allow-loopback-pinentry
      '';
    };
  };

  programs.browserpass.enable = true;
}
