{ pkgs, nix-citizen, ...}:
{
  environment.systemPackages = with pkgs; [
    nix-citizen.packages.${system}.star-citizen
  ];
}