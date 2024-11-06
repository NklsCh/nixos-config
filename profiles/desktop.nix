{ home-manager, gpu, ... }:
if gpu == "nvidia" then
  {
    imports = [
      home-manager.nixosModules.home-manager
      ../assets
      ../hosts
      ../modules
      ../modules/app/profiles/desktop.nix
      ../modules/hardware/profiles/${gpu}.nix
      ../scripts
      ../users
    ];
  }
else
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
