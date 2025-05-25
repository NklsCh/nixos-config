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
      signing = {
        key = "42A8C302343E6F9E";
        signByDefault = true;
      };
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
