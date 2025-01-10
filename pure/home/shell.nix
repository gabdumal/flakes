{ lib, ... }:
{

  programs = {
    ## Shells
    zsh = {
      enable = lib.mkDefault true;
    };

    fish = {
      enable = lib.mkDefault true;
    };

    ## Themes
    starship = {
      enable = true;
    };

    ## Tools
    zoxide = {
      enable = true;
      options = [
        "--cmd cd"
      ];
    };
  };

}
