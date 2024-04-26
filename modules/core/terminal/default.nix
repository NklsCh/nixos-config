{ pkgs, home-manager, username, ... }:
{
  imports = [
    ./bash
    ./zsh
  ];
  
  # ---- Home Config ---- #
  home-manager.users.${username} = {
    programs.git.enable = true;
    programs.neovim.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    alacritty
    wget
    neovim
    alacritty
    zsh
    zplug
  ];
}
