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
    dotDir = ".config/zsh";
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };
    initExtraFirst = ''
      source ~/.config/zsh/.p10k.zsh
    '';
    initExtra = ''
      POWERLEVEL9K_DISABLE_CONFIGURATION_WIZRAD=true
      bindkey '^I' autosuggest-accept
      eval "$(zoxide init --cmd cd zsh)"
    '';
  };
}
