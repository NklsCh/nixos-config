{
  pkgs,
  nix-citizen,
  username,
  ...
}:
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      (nix-citizen.packages.${system}.star-citizen.override {
        gameScopeEnable = false;
        location = "/media/512-GB-SSD/Games/StarCitizen";
      })
    ];
  };
}
