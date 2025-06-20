{
  disko,
  home-manager,
  sops-nix,
  systemType,
  ...
}:
{
  imports = [
    disko.nixosModules.disko
    home-manager.nixosModules.home-manager
    sops-nix.nixosModules.sops
    ./profiles/${systemType}.nix
    ./profiles
  ];
}
