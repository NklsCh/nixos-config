{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      geist-font
      nerd-fonts.geist-mono
      noto-fonts-emoji
    ];

    fontconfig = {
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
