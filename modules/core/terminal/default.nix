{ pkgs, username, ... }:
{
  imports = [
    ./alacritty
    ./bash
    ./nvim
    ./p10k
    ./zsh
  ];

  home-manager.users.${username} = {
    programs.git.enable = true;
    # programs.alacritty.enable = true;
  };
}
