{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rclone
    cinnamon.nemo
    brave
    discord
    bitwarden
    unzip
    home-manager
    oh-my-posh
    teams-for-linux
    zoxide
    sddm-chili-theme
    neofetch
    nix-output-monitor
    warp-terminal
  ];
}
