{ pkgs, ... }:
{
  programs.gnupg = {
    agent.enable = true;
    agent.enableSSHSupport = true;
    agent.pinentryPackage = pkgs.pinentry-gnome3;
    agent.settings = {
      allow-loopback-pinentry = true;
    };
  };
}
