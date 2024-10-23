{ pkgs, hostName, ... }:
let
  dotfiles = {
    "Laptop" = [ (import ./laptop.nix { inherit pkgs; }) ];
    "Desktop" = [ (import ./desktop.nix { inherit pkgs; }) ];
  };
in
{
  imports = dotfiles.${hostName} or [ ];
}
