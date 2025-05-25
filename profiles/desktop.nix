{ home-manager, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
    ../assets
    ../hosts
    ../modules
    ../profiles
    ../scripts
    ../users
  ];
}
