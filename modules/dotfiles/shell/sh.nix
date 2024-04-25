{ config, pkgs, ... }:

let
  myAliases = {
    neofetch = "disfetch";
    vi = "nvim";
    vim = "nvim";
  };
in 

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # autosuggestion.enable = true; //Doesent work idk why
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };
    initExtra = ''
      eval "$(oh-my-posh init zsh --config ~/.poshThemes/theme.omp.json)"
      eval "$(zoxide init --cmd cd zsh)"
    '';
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
    initExtra = ''
      eval "$(oh-my-posh init bash --config ~/.poshThemes/theme.omp.json)"
      eval "$(zoxide init --cmd cd bash)"
    '';
  };
}
