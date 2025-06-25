{ inputs, system, ... }:
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    desktopEnvironment = "gnome";
    displayManager = "greetd";
    hostName = "Laptop";
    systemType = "desktop";
    username = "choinowski";
    inherit system;
  } // inputs;
  modules = [
    ../.
    (
      { ... }:
      {
        system = {
          gpu.enable = true;
          gpu.brand = "nvidia";
          boot.isDevDrive = false;
        };
        devTools.enable = true;
        gaming.enable = true;
      }
    )
  ];
}
