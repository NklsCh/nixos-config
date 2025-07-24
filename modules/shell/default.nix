{ pkgs, username, ... }:
{
  imports = [
    ./bash.nix
    ./p10k
    ./zsh.nix
  ];

  home-manager.users.${username} = {
    programs.git = {
      enable = true;
      userName = "Niklas Choinowski";
      userEmail = "niklas.choinowski@proton.me";
      signing = {
        key = "DB96D1F1A8526D86";
        signByDefault = true;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    acpi
    bat
    bat-extras.batman
    clang
    eza
    gh
    nixd
    nixfmt-rfc-style
    unzip
    zoxide
  ];
}
