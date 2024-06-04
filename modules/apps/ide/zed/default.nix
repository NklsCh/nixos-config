{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zed-editor
  ];
}
