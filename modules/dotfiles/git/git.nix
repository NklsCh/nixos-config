{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Niklas Choinowski";
    userEmail = "niklas.choinowski@gmail.com";
  };
}
