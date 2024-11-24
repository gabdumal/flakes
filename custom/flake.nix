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

      pkgs = import nixpkgs { inherit system; };
    in
    {

      nixosConfigurations = {
        custom = pkgs.lib.nixosSystem {
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
          pkgs = pkgs;
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
