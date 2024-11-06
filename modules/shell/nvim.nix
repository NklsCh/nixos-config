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
      ".config/nvim/lua".source = ../config/nvim/lua;
      ".config/nvim/init.lua".source = ../config/nvim/init.lua;
      ".config/nvim/.stylua.toml".source = ../config/nvim/.stylua.toml;
    };
  };
}
