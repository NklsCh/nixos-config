{ home-manager, ... }:
{
  imports = [
    home-manager.nixosModules.home-manager
    ../assets
    ../hosts
    ../modules
    ../modules/app/profiles/gaming.nix
    ../modules/hardware/profiles/nvidia.nix
    ../scripts
    ../users
  ];
}
