let
  myAliases = {
    vi = "nvim";
    vim = "nvim";
  };
in 

{
  programs.bash = {
    enableCompletion = true;
    shellAliases = myAliases;
    interactiveShellInit = ''
      eval "$(oh-my-posh init bash --config ~/.poshThemes/theme.omp.json)"
      eval "$(zoxide init --cmd cd bash)"
    '';
  };
}
