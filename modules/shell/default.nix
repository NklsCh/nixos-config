{ pkgs, username, ... }:
{
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./nvim.nix
    ./p10k.nix
    ./zsh.nix
  ];

  home-manager.users.${username} = {
    programs.git = {
      enable = true;
      userName = "Niklas Choinowski";
      userEmail = "niklas.choinowski@gmail.com";
      signing = {
        key = "D41980C036A712CF";
        signByDefault = true;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    zoxide
    gh
    unzip
    acpi
    nixfmt-rfc-style
    nixd
  ];
}
