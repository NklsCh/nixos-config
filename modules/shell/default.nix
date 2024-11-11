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
      userEmail = "niklas.choinowski@gmail.com@";
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
