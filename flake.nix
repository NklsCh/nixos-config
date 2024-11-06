{
  description = "Nixos config flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations =
        let
          system = "x86_64-linux";

          # Module sets
          commonModules = [
            { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
            ./profiles/desktop.nix
            ./profiles/developer.nix
            ./profiles/gaming.nix
          ];

          # Define common configuration
          mkHost =
            hostConfig:
            nixpkgs.lib.nixosSystem {
              specialArgs = {
                username = "choinowski";
                inherit system;
                inherit (hostConfig)
                  gpu
                  gpuBrand
                  hostName
                  isDevDrive
                  ;
              } // inputs;

              modules = hostConfig.modules;
            };

          # Define hosts configurations
          hosts = {
            Laptop = {
              gpu = false;
              gpuBrand = "";
              hostName = "Laptop";
              isDevDrive = true;
              modules = commonModules ++ [ ];
            };

            Desktop = {
              gpu = true;
              gpuBrand = "nvidia";
              hostName = "Desktop";
              isDevDrive = false;
              modules = commonModules ++ [ ];
            };
          };
        in
        builtins.mapAttrs (name: config: mkHost config) hosts;
    };
}
