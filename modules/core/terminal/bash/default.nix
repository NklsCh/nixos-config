{ config, pkgs, ... }:

let
  myAliases = {
    neofetch = "disfetch";
    vi = "nvim";
    vim = "nvim";
  };
in 

{
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
