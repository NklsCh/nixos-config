{
  desktopEnvironment,
  displayManager,
  ...
}:
{
  imports = [
    ./desktopEnvironments/${desktopEnvironment}
    ./displayManagers/${displayManager}
    ./rofi
    ./styling
    ./xdg
  ];

  programs.dconf.enable = true;
}
