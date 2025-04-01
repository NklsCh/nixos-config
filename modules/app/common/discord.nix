{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (discord.override {
      withOpenASAR = false;
      withVencord = true;
    })
  ];
}
