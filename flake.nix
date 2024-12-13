{
  description = "Nixos config flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
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
      url = "github:nklsch/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
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
              ./profiles/options.nix
              {
                system = {
                  gpu = {
                    enable = true;
                  };
                  boot = {
                    isDevDrive = false;
                  };
                  profiles = {
                    developer = true;
                    gaming = false;
                  };
                };
              }
              ./.
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
              ./profiles/options.nix
              {
                system = {
                  gpu = {
                    enable = true;
                    brand = "nvidia";
                  };
                  boot = {
                    isDevDrive = false;
                  };
                  profiles = {
                    developer = true;
                    gaming = true;
                  };
                };
              }
              ./.
            ];
          };
      };
    };
}
