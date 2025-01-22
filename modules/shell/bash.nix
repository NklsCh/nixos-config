let
  myAliases = {
    vi = "nvim";
    vim = "nvim";
    ff = "fastfetch";
    la = "ls -la";
    ll = "ls -l";
    ga = "git add .";
    os = "nh os switch -a";
    ou = "nh os switch -a -u";
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
