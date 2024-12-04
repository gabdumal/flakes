{

  description = "A pure NixOS configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/release-24.11";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
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
