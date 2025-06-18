{ inputs, system, ... }:
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    desktopEnvironment = "hyprland";
    displayManager = "sddm";
    hostName = "Desktop";
    systemType = "desktop";
    username = "v3rm1n";
    inherit system;
  } // inputs;
  modules = [
    { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
    ../.
    (
      { pkgs, ... }:
      {
        specs = {
          gpu.enable = true;
          gpu.brand = "nvidia";
          boot.isDevDrive = false;
        };
        devTools.enable = true;
        devTools.optionalPackages = [
          pkgs.zed-editor
        ];
        gaming.enable = true;
        contentcreation.enable = false;
      }
    )
  ];
}
