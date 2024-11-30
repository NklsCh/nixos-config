{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      # nerd-fonts.jetbrains-mono
      nerd-fonts.geist-mono
      geist-font
      noto-fonts-emoji
    ];

    fontconfig = {
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
