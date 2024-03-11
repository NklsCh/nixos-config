{ config, pkgs, ... }:
{
  progams.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    package = with pkgs.vimPlugins; [
      nvchad
    ];
  };
}
