{
  username,
  ...
}:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
  };

  home-manager.users.${username} = _: {
    home.file = {
      ".config/nvim/lua".source = ./nvchad/lua;
      ".config/nvim/init.lua".source = ./nvchad/init.lua;
      ".config/nvim/.stylua.toml".source = ./nvchad/.stylua.toml;
    };
  };
}
