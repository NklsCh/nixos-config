{ username, ... }:
{
  home-manager.users.${username} = _: {
    services.dunst.enable = true;
  };
}
