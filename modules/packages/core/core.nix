{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rclone
    discord
    bitwarden
    unzip
    home-manager
    oh-my-posh
    teams-for-linux
    zoxide
    sddm-chili-theme
    neofetch
    # nh
    nix-output-monitor
    warp-terminal
  ];
}
