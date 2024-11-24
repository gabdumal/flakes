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

      lib = nixpkgs.lib;
      pkgs = import nixpkgs { inherit system; };
    in
    {

      nixosConfigurations = {
        pure = lib.nixosSystem {
          inherit system;
          modules = [
            ./system/system.nix
          ];
        };
      };

      homeConfigurations = {
        custom = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home/home.nix
          ];
        };
      };

    };

}
