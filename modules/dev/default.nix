{ pkgs, ... }:
{
  imports = [
    ./editor
  ];

  environment.systemPackages = with pkgs; [
    devenv
  ];
}
