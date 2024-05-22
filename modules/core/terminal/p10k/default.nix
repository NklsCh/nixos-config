{ home-manager, pkgs, ... }:
{
  home.file = {
    ".config/zsh/.p10k.zsh".source = ./p10k-config/p10k.zsh;
  };
}
