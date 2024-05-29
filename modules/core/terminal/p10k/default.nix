{ username, ... }:
{
  home-manager.users.${username} = _: {

    home.file = {
      ".config/zsh/.p10k.zsh".source = ./p10k-config/p10k.zsh;
    };
  };
}
