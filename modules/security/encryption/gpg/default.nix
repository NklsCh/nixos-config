{ username, pkgs, ... }:
{
  programs.gnupg = {
    agent.enable = true;
    agent.enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    pinentry-curses
    pinentry-gnome3
  ];

  home-manager.users.${username} = _: {
    home.file = {
      ".gnupg/gpg-agent.conf".source = ./gpg-agent.conf;
    };
  };
}
