{ username, pkgs, ... }:
let
  passwordStoreRepo = pkgs.fetchFromGitHub {
    owner = "NklsCh";
    repo = "passwd";
    rev = "main"; # Use a specific commit hash here
    sha256 = "sha256-I2UvrvgUr3Kzg9Fj8ACXQwSXeqJZbWDp0PLfSK8MXrg="; # Replace with the correct hash
  };
in
{
  environment.systemPackages = with pkgs; [
    (pass.withExtensions (exts: [ exts.pass-otp ]))
    qtpass
  ];

  environment.variables = {
    PASSWORD_STORE_ENABLE_EXTENSIONS = "true";
  };

  home-manager.users.${username} = _: {
    home.file = {
      ".password-store" = {
        source = "${passwordStoreRepo}";
        recursive = true;
      };
    };
  };

  programs.browserpass.enable = true;
}