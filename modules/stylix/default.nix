{ stylix, pkgs, ... }:
{
  imports = [ stylix.nixosModules.stylix ];
  stylix = {
    enable = true;
    # base16Scheme = {
    #   base00 = "2b2b2b"; # background
    #   base01 = "323232"; # line cursor
    #   base02 = "323232"; # statusline
    #   base03 = "606366"; # line numbers
    #   base04 = "a4a3a3"; # selected line number
    #   base05 = "a9b7c6"; # foreground
    #   base06 = "ffc66d"; # function bright yellow
    #   base07 = "ffffff";
    #   base08 = "4eade5"; # cyan
    #   base09 = "689757"; # blue
    #   base0A = "bbb529"; # yellow
    #   base0B = "6a8759"; # string green
    #   base0C = "629755"; # comment green
    #   base0D = "9876aa"; # purple
    #   base0E = "cc7832"; # orange
    #   base0F = "808080"; # gray
    # };
    image = ../../assets/wallpapers/wallpaper_reddit.png;
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    targets = {
      grub.enable = false;
      plymouth.enable = false;
    };
    opacity = {
      terminal = 0.9;
      applications = 0.9;
      desktop = 0.9;
      popups = 0.9;
    };
  };
}
