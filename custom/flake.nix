{

  description = "Defines hardware configuration and custom definitions.";

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
      fullname = "[ Full Name ]";
      username = "[ username ]";
      hostname = "[ hostname ]";

      lib = nixpkgs.lib;
      legacyPkgs = nixpkgs.legacyPackages.${system};
    in
    {

      nixosConfigurations = {
        custom = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit system;
            inherit fullname;
            inherit username;
            inherit hostname;
          };
          modules = [
            "${pure}/system/system.nix"
            ./system/basic.nix
            ./system/system.nix
          ];
        };
      };

      homeConfigurations = {
        custom = home-manager.lib.homeManagerConfiguration {
          pkgs = legacyPkgs;
          extraSpecialArgs = {
            inherit fullname;
            inherit username;
          };
          modules = [
            "${pure}/home/home.nix"
            ./home/basic.nix
            ./home/home.nix
          ];
        };
      };

    };

}

