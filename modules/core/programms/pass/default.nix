{ username, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    pass
    gnupg
    pinentry-curses
    passExtensions.pass-otp
    qtpass
    vivaldi
  ];

  environment.variables = {
    PASSWORD_STORE_ENABLE_EXTENSIONS = "true";
  };

  home-manager.users.${username} = _: {
    home.file = {
      ".gnupg/gpg-agent.conf".text = ''
        use-agent
        pinentry-mode loopback
        pinentry-program /run/current-system/sw/bin/pinentry-tty
        allow-loopback-pinentry
      '';
    };
  };

  programs.browserpass.enable = true;
}
