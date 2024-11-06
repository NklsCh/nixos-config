{ home-manager, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
    ../hosts
    ../modules/shell
    ../users
  ];
}
