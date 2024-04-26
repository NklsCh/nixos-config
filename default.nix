{ home-manager, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
    ./modules/default.nix
  ];
}
