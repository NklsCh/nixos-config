let
  myAliases = import ./commonAliases.nix;
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
