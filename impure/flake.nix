{

  description = "Flake that defines hardware configurations";

  inputs = {
    pure = {
      url = "github:gabdumal/flakes?dir=pure";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, pure, ... } @ inputs:
    let
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        impure = lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            "${pure}/config.nix"
            ./configuration.nix
          ];
        };
      };
    };

}
