{

  description = "Gabdumal's flakes templates";

  outputs = { self }: {

    templates = {

      pure = {
        path = ./pure;
        description = "A pure NixOS configuration";
      };

      impure = {
        path = ./impure;
        description = "Flake that defines hardware configurations";
      };

    };

  };

}
