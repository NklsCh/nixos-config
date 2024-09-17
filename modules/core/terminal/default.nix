{ pkgs, username, ... }:
{
  imports = [
    ./alacritty
    ./bash
    ./fonts
    ./kitty
    ./nvim
    ./p10k
    ./zsh
  ];

  home-manager.users.${username} = {
    programs.git.enable = true;
  };
  environment.systemPackages = with pkgs; [
    zoxide
    gh
    unzip
    acpi
  ];
}
