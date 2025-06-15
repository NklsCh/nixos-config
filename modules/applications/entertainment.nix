{ pkgs, spicetify-nix, ... }:
{
  imports = [ spicetify-nix.nixosModules.default ];

  programs.spicetify =
    let
      spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      theme = spicePkgs.themes.catppuccin;
    };
}
