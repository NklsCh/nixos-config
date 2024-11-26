{
  pkgs,
  username,
  zen-browser,
  ...
}:
{
  home-manager.users.${username} = {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;
    };
  };
  environment.systemPackages = [
    zen-browser.packages.${pkgs.system}.default
  ];
}
