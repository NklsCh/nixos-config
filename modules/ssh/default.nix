{ username, ... }:
{
  users.users.${username} = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKZrLPuqA5vUxuNNn/yLrDThwgSFdpjNRKMGxEX9dRCN ${username}"
    ];
  };

  services.openssh = {
    enable = true;
    ports = [ 4545 ];
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };
}
