{ ... }:
{
  services = {
    gvfs.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
    flatpak.enable = true;
    gnome = {
      gnome-keyring.enable = true;
    };
  };
}
