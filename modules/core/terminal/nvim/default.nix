{ pkgs, home-manager, username, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
  };

  home-manager.users.${username} = _: {
    home.file = {
      ".config/nvim".source = ./nvchad;
    };
  };
}
