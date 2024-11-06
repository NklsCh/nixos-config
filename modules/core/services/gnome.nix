{ username, ... }:
{
  home-manager.users.${username} = {
    services.gnome-keyring = {
      enable = true;
      components = [
        # "pkcs11"
        "secrets"
        "ssh"
      ];
    };
  };
}
