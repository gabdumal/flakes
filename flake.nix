{

  description = "Gabdumal's flakes templates.";

  outputs = { self }: {

    templates = {

      pure = {
        path = ./pure;
        description = "A pure NixOS configuration.";
      };

      custom = {
        path = ./custom;
        description = "Defines hardware configuration and custom definitions.";
      };

    };

  };

}
