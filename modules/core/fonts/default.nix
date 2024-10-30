{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          # "JetBrainsMono"
          "GeistMono"
        ];
      })
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
