{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ lutris heroic ];

  programs = {
    steam.enable = true;
  };
}
