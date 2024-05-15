{ config, pkgs, ... }:

let
  myAliases = {
    vi = "nvim";
    vim = "nvim";
  };
in 

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };
    initExtra = ''
      bindkey '^I' autosuggest-accept
      eval "$(oh-my-posh init zsh --config ~/.poshThemes/theme.omp.json)"
      eval "$(zoxide init --cmd cd zsh)"
    '';
  };
}
