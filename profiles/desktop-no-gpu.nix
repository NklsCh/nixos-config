{ home-manager, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
    ../assets
    ../hosts
    ../modules
    ../modules/app/profiles/desktop.nix
    ../scripts
    ../users
  ];
}
