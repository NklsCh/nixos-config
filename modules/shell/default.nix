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
      userEmail = "v3rm1n@tutamail.com";
      signing = {
        key = "0BD7EAA9BBF1EDA0";
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
