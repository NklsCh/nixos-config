{ home-manager, config, pkgs, ... }:
{
  home.file = {
    ".p10k.zsh".source = ./p10k-config/p10k.zsh;
  };
}
