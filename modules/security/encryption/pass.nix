{ pkgs, username, ... }:
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

  home-manager.users.${username} = {
    home.file = {
      ".mozilla/native-messaging-hosts/com.github.browserpass.native.json".source = "${pkgs.browserpass}/lib/mozilla/native-messaging-hosts/com.github.browserpass.native.json";
    };
  };
}
