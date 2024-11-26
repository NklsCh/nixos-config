{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (pass.withExtensions (exts: [ exts.pass-otp ]))
    qtpass
    browserpass
  ];

  environment.variables = {
    PASSWORD_STORE_ENABLE_EXTENSIONS = "true";
  };

  programs.browserpass.enable = true;

  environment.etc."mozilla/native-messaging-hosts/com.github.browserpass.native.json" = {
    source = "${pkgs.browserpass}/lib/mozilla/native-messaging-hosts/com.github.browserpass.native.json";
  };
}
