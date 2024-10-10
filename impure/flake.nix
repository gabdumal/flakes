{

  description = "Flake that defines hardware configurations";

  inputs = {
    pure = {
      url = "github:gabdumal/flakes?dir=pure";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, pure, ... } @ inputs:
    let
      system = "x86_64-linux";
      fullname = "[Full Name]";
      username = "[username]";
      hostname = "[hostname]";

      lib = nixpkgs.lib;
      legacyPkgs = nixpkgs.legacyPackages.${system};
    in
    {

      nixosConfigurations = {
        impure = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit system;
            inherit fullname;
            inherit username;
            inherit hostname;
          };
          modules = [
            "${pure}/configuration.nix"
            ./configuration.nix
            ./custom-configuration.nix
          ];
        };
      };

      homeConfigurations = {
        impure = home-manager.lib.homeManagerConfiguration {
          pkgs = legacyPkgs;
          extraSpecialArgs = {
            inherit fullname;
            inherit username;
          };
          modules = [
            ./home.nix
            ./custom-home.nix
          ];
        };
      };

    };

}
