{ username, ... }:
{
  home-manager.users.${username} = _: {
    home.file = {
      ".config/zsh/.p10k.zsh".source = ./p10k.zsh;
    };
  };
}
