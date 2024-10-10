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
      fullname = "[Full Name]";
      username = "[username]";
      hostname = "[hostname]";

      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      nixosConfigurations = {
        impure = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
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
          inherit pkgs;
          extraSpecialArgs = {
            inherit fullname;
            inherit username;
            inherit lib;
            inherit pkgs;
          };
          modules = [
            "${pure}/home.nix"
            ./home.nix
            ./custom-home.nix
          ];
        };
      };

    };

}
