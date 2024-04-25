{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    wget
    neovim
    alacritty
    zsh
    zplug
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
