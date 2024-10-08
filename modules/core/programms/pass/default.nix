{ username, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ 
    pass-wayland
    gnupg
    pinentry-curses
    passExtensions.pass-otp
  ];
}
