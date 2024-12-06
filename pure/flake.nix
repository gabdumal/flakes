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
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
    in
    {

      nixosConfigurations = {
        pure = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./system/system.nix
          ];
        };
      };

      homeConfigurations = {
        pure = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };

          modules = [
            ./home/home.nix
          ];
        };
      };

    };

}
