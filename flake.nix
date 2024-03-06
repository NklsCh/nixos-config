{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = system; config.allowUnfree = true; };
      pkgs-unstable = import nixpkgs-unstable { system = system; config.allowUnfree = true; };
    in
    {
    
      nixosConfigurations = {
        Laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
	    inherit pkgs-unstable;
	  };
          modules = [ 
            ./hosts/Laptop/configuration.nix
          ];
        };

      };
    };
}
