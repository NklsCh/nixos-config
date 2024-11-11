{
  pkgs,
  nix-gaming,
  username,
  ...
}:
{
  home-manager.users.${username} = {
    home.packages = [
      (nix-gaming.packages.${pkgs.hostPlatform.system}.star-citizen.override {
        tricks = [
          "arial"
          "vcrun2019"
          "win10"
          "sound=alsa"
        ];
        gameScopeEnable = false;
        # useUmu = true;
        location = "/media/512-GB-SSD/Games/StarCitizen";
      })
    ];
  };
}
