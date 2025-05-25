{ pkgs, username, ... }:
{
  imports = [
    ./bash.nix
    ./kitty.nix
    ./nvim.nix
    ./p10k.nix
    ./zsh.nix
  ];

  home-manager.users.${username} = {
    programs.git = {
      enable = true;
      userName = "Niklas Choinowski";
      userEmail = "niklas.choinowski@gmail.com";
      /*
        signing = {
          key = "0BD7EAA9BBF1EDA0";
          signByDefault = true;
        };
      */
    };
  };
  environment.systemPackages = with pkgs; [
    acpi
    clang
    gh
    nixd
    nixfmt-rfc-style
    unzip
    zoxide
  ];
}
