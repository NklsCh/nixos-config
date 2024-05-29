{ pkgs, username, ... }:
{
  imports = [
    ./alacritty
    ./bash
    ./fonts
    ./nvim
    ./p10k
    ./zsh
  ];

  home-manager.users.${username} = {
    programs.git.enable = true;
    # programs.alacritty.enable = true;
  };
  environment.systemPackages = with pkgs; [
    zoxide
  ];
}
