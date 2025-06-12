{
  ...
}:
{
  imports = [
    ./displayManager/sddm.nix
    ./electron
    ./hyprwm
    ./rofi
    ./styling
    ./xdg
  ];

  programs.dconf.enable = true;
}
