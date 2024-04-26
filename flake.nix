{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = system; config.allowUnfree = true; };
      pkgs-unstable = import nixpkgs-unstable { system = system; config.allowUnfree = true; };
    in
    {
      nixosConfigurations = {
        Laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            username = "choinowski";
	          inherit inputs pkgs-unstable;
	        };
          modules = [ 
            ./hosts/Laptop/configuration.nix
            ./modules/virt
          ];
        };
      };
    };
}
