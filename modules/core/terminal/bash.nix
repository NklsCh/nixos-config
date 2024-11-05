let
  myAliases = {
    vi = "nvim";
    vim = "nvim";
  };
in

{
  programs.bash = {
    completion.enable = true;
    shellAliases = myAliases;
    interactiveShellInit = ''
      eval "$(zoxide init --cmd cd bash)"
    '';
  };
}
