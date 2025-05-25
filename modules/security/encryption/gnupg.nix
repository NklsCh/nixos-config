{ username, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnupg
    pinentry-curses
    pinentry-gnome3
  ];

  home-manager.users.${username} = _: {
    home.file = {
      ".gnupg/gpg-agent.conf".source = ../../config/gpg-agent.conf;
    };
  };
}
