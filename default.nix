{ systemType, ... }:
{
  imports = [
    ./profiles/${systemType}.nix
    ./profiles
  ];
}
