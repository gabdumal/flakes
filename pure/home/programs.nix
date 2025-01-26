{ lib, ... }:
{

  programs = {
    ## System
    git = {
      enable = lib.mkDefault true;
      extraConfig = lib.mkDefault {
        defaultBranch = "main";
      };
    };
  };

}
