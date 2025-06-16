{ username, ... }:
{
  home-manager.users.${username} = _: {
    services.network-manager-applet.enable = true;
  };
}
