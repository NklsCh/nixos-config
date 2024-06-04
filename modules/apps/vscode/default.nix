{ username, ... }:
{
  home-manager.users.${username} = {
    programs.vscode = {
      enable = true;
      enableUpdateCheck = true;
      enableExtensionUpdateCheck = true;
    };
  };
}
