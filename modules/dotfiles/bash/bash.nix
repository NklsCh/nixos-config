{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      neofetch = "disfetch";
      vi = "nvim";
      vim = "nvim";
    };
    initExtra = ''
      eval "$(oh-my-posh init bash --config ~/.poshThemes/theme.omp.json)"
      eval "$(zoxide init --cmd cd bash)"
    '';
  };
}
