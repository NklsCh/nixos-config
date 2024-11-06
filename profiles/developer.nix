{ home-manager, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
    ../assets
    ../hosts
    ../modules
    ../modules/dev
    ../scripts
    ../users
  ];
}
