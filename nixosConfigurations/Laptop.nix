{ inputs, system, ... }:
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    desktopEnvironment = "hyprland";
    displayManager = "greetd";
    hostName = "Laptop";
    systemType = "desktop";
    username = "v3rm1n";
    wallpaper = "dark-wallpaper.jpg";
    inherit system;
  } // inputs;
  modules = [
    ../.
    (
      { ... }:
      {
        specs = {
          gpu.enable = false;
          boot.isDevDrive = false;
        };
        devTools.enable = true;
        gaming.enable = false;
      }
    )
  ];
}
