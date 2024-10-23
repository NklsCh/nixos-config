{
  pkgs,
  ...
}:
{
  imports = [
    ./config
    ./electron
    ./greetd
    ./rofi
  ];

  environment = {
    sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      brightnessctl
      grim
      gthumb
      hyprpanel
      libnotify
      nemo-with-extensions
      networkmanagerapplet
      pavucontrol
      playerctl
      pywal
      rofi-wayland
      slurp
      swww
      wl-clipboard
      xwaylandvideobridge
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.hyprlock = {
    enable = true;
  };

  programs.dconf.enable = true;

  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.hyprlock = {
    text = ''
      auth      required  pam_gnome_keyring.so
      session   required  pam_gnome_keyring.so auto_start
    '';
  };
}
