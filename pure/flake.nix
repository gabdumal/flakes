{

  description = "A pure NixOS configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
    };
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, ... }:
    let
      system = "x86_64-linux";
    in
    {

      nixosConfigurations = {
        pure = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            catppuccin.nixosModules.catppuccin
            ./system/system.nix
          ];
        };
      };

      homeConfigurations = {
        pure = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };

          modules = [
            catppuccin.homeManagerModules.catppuccin
            ./home/home.nix
          ];
        };
      };

    };

}
