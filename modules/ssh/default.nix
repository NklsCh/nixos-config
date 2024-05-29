{ username, ... }:
{
  users.users.${username} = {
    openssh.authorizedKeys.keys = [
      "SHA256:+NpukwfH7YBATEVebnQodXkPAM4oFLsOVeFMyM6uWfA ${username}"
    ];
  };

  services.openssh = {
    enable = true;
    ports = [ 4545 ];
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };
}