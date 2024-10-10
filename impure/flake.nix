{

  description = "Flake that defines hardware configurations";

  inputs = {
    pure = {
      url = "github:gabdumal/flakes?dir=pure";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, pure, ... } @ inputs:
    let
      system = "x86_64-linux";

      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      nixosConfigurations = {
        impure = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            "${pure}/configuration.nix"
            ./configuration.nix
          ];
        };
      };

      homeConfigurations = {
        impure = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            "${pure}/home.nix"
            ./home.nix
          ];
        };
      };

    };

}
