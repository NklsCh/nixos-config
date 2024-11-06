{ home-manager, gpu, ... }:
if gpu then
  {
    imports = [
      home-manager.nixosModules.home-manager
      ../assets
      ../hosts
      ../modules
      ../modules/app/profiles/gaming.nix
      ../modules/hardware/profiles/gpu.nix
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
      ../modules/app/profiles/gaming.nix
      ../scripts
      ../users
    ];
  }
