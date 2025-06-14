{
  description = "Nixos config flake";

  inputs = {
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
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      agenix,
      disko,
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
              desktopEnvironment = "gnome";
              displayManager = "greetd";
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
                  devTools.enable = true;
                  gaming.enable = true;
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
              username = "v3rm1n";
              hostName = "Desktop";
              systemType = "desktop";
              desktopEnvironment = "hyprland";
              displayManager = "sddm";
              inherit system;
            } // inputs;
            modules = [
              { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
              agenix.nixosModules.default
              disko.nixosModules.disko
              ./.
              (
                { pkgs, ... }:
                {
                  system = {
                    gpu.enable = true;
                    gpu.brand = "nvidia";
                    boot.isDevDrive = false;
                  };
                  devTools.enable = true;
                  devTools.optionalPackages = [
                    pkgs.zed-editor
                  ];
                  gaming.enable = true;
                  contentcreation.enable = true;
                }
              )
            ];
          };
      };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    };
}
