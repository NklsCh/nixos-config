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
      nixosConfigurations = {
        Laptop =
          let
            system = "x86_64-linux";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              username = "choinowski";
              hostName = "Laptop";
              gpu = false;
              gpuBrand = "";
              inherit system;
            } // inputs;
            modules = [
              { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
              ./profiles/desktop-no-gpu.nix
              ./profiles/developer.nix
              ./profiles/gaming.nix
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
              gpu = true;
              gpuBrand = "nvidia";
              inherit system;
            } // inputs;
            modules = [
              { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
              ./profiles/desktop.nix
              ./profiles/developer.nix
              ./profiles/gaming.nix
            ];
          };
      };
    };
}
