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
      ".config/nvim/lua".source = ./config/lua;
      ".config/nvim/init.lua".source = ./config/init.lua;
      ".config/nvim/.stylua.toml".source = ./config/.stylua.toml;
    };
  };
}
