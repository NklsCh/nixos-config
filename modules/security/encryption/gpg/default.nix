{ username, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnupg
    pinentry-curses
    pinentry-gnome3
  ];

  home-manager.users.${username} = _: {
    home.file = {
      ".gnupg/gpg-agent.conf".source = ./gpg-agent.conf;
    };
  };

  /*
    programs.gpg = {
      agent.enable = true;
      agent.enableSSHSupport = true;
      agent.pinentryPackage = pkgs.pinentry-gnome3;
      agent.settings = {
        allow-loopback-pinentry = true;
      };
    };
  */
}
