{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rclone
    brave
    discord
    bitwarden
    unzip
    home-manager
    oh-my-posh
    teams-for-linux
    zoxide
    sddm-chili-theme
    disfetch
  ];
}
