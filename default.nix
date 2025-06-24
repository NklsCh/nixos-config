{
  agenix,
  disko,
  home-manager,
  systemType,
  ...
}:
{
  imports = [
    agenix.nixosModules.default
    disko.nixosModules.disko
    home-manager.nixosModules.home-manager
    ./profiles/${systemType}.nix
    ./profiles
  ];
}
