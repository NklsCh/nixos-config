{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (pass.withExtensions (exts: [ exts.pass-otp ]))
    qtpass
  ];

  environment.variables = {
    PASSWORD_STORE_ENABLE_EXTENSIONS = "true";
  };

  programs.browserpass.enable = true;
}
