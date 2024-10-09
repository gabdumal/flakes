{

  description = "A pure NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        pure = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./config.nix
          ];
        };
      };
    };

}
