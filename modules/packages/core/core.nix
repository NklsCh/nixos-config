{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    brave
    discord
    bitwarden
    unzip
    home-manager
    oh-my-posh
    teams-for-linux
    zoxide
    sddm-chili-theme
  ];
}
