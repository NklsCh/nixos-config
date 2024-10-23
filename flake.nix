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
      inputs.darwin.follows = "";
    };
    hyprland = {
      url = "github:hyprwm/hyprland";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      supportedSystem = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystem;
      nixpkgsFor = forAllSystems (
        system:
        import nixpkgs {
          inherit system;
        }
      );
    in
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
              hyprlandConfig = "laptop";
              inherit system;
            } // inputs;
            modules = [
              { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
              ./.
              ./modules/games
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
              hyprlandConfig = "desktop";
              inherit system;
            } // inputs;
            modules = [
              { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
              ./.
              ./modules/hardware/nvidia
              ./modules/games
              ./modules/desktop
            ];
          };
      };
    };
}
