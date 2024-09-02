{ stylix, pkgs, ... }:
{
  imports = [ stylix.nixosModules.stylix ];
  stylix = {
    enable = true;
    image = ../../assets/wallpapers/moon.jpg;
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
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
    };
  };
}
