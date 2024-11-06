{ username, ... }:
{
  home-manager.users.${username} = _: {

    home.file = {
      ".config/zsh/.p10k.zsh".source = ../config/p10k.zsh;
    };
  };
}
