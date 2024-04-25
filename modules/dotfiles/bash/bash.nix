{ config, pkgs, ... }:
{
  program.bash = {
    enable = true;
    shellAliases = {
      cd = "z";
    };
  };
}
