{ lib, pkgs, ... }: {

  environment = {
    sessionVariables.NAUTILUS_4_EXTENSION_DIR = lib.mkDefault "${pkgs.nautilus-python}/lib/nautilus/extensions-4";
    pathsToLink = [
      "/share/nautilus-python/extensions"
    ];
  };

}
