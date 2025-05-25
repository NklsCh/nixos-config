{ username, ... }:
{
  users.users.${username} = {
    openssh.authorizedKeys.keys = [
    ];
  };
}
