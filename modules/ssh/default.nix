{ username, ... }:
{
  users.users.${username} = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHHM/ccSwF9OHcYZjhw4M5L/j5c4P+OkTpwuzmSXfdvt ${username}"
    ];
  };

  services.openssh = {
    enable = true;
    ports = [ 4545 ];
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };
}