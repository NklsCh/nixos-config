{ username, home-manager, ... }:
{
  home-manager.users.${username} = _: {
    home.file = {
      ".scripts/" = {
        source = ../scripts;
        executable = true;
      };
    };
  };
}
