{ username, ... }:
{
  users.users.${username} = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKRcnvF2EYThdhGp45gfbOck/ZXDZR5CrBiMm0eIx3Vl choinowski@Desktop"
    ];
  };
}
