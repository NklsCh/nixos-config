{
  desktopEnvironment,
  displayManager,
  ...
}:
{
  imports = [
    ./desktopEnvironments/${desktopEnvironment}
    ./displayManagers/${displayManager}
    ./electron
    ./rofi
    ./styling
    ./xdg
  ];

  programs.dconf.enable = true;
}
