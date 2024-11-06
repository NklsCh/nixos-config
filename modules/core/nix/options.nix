{ ... }:
{
  nix.extraOptions = ''
    extra-substituters = https://denenv.cachnix.org
    extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=
  '';
}
