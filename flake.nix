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
  };

  outputs = { self, nixpkgs, ... }@attrs:
    let
      supportedSystem = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystem;
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
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
	        } // attrs;
          modules = [
            ./.
            ./modules/steam
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
	        } // attrs;
          modules = [
            ./.
            ./modules/hardware/nvidia
            ./modules/steam
          ];
        };
      };
    };
}
