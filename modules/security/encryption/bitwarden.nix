{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
    bitwarden
    bitwarden-cli
    bitwarden-menu
    ];
  };
}
