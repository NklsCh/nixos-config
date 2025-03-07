{
  description = "Nixos config flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-citizen = {
      url = "github:LovingMelody/nix-citizen";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      agenix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        Laptop =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "choinowski";
              hostName = "Laptop";
              systemType = "desktop";
              inherit system;
            } // inputs;
            modules = [
              { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
              agenix.nixosModules.default
              ./.
              (
                { ... }:
                {
                  system = {
                    gpu.enable = true;
                    gpu.brand = "nvidia";
                    boot.isDevDrive = false;
                  };
                  devTools.enable = true; # Enable the feature
                  devTools.optionalPackages = [ ];
                  gaming.enable = true; # Enable the feature
                  gaming.optionalPackages = [ ];
                }
              )
            ];
          };
        Desktop =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "choinowski";
              hostName = "Desktop";
              systemType = "desktop";
              inherit system;
            } // inputs;
            modules = [
              { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
              agenix.nixosModules.default
              ./.
              (
                { ... }:
                {
                  system = {
                    gpu.enable = true;
                    gpu.brand = "nvidia";
                    boot.isDevDrive = false;
                  };
                  devTools.enable = true; # Enable the feature
                  devTools.optionalPackages = [ ];
                  gaming.enable = true; # Enable the feature
                  gaming.optionalPackages = [ ];
                }
              )
            ];
          };
      };
    };
}
