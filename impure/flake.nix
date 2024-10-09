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

  outputs = { self, nixpkgs, pure, home-manager, ... } @ inputs:
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
            "${pure}/config.nix"
            ./configuration.nix
          ];
        };
      };

      homeConfigurations = {
        impure = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
          ];
        };
      };
    };

}
