{ lib, ... }:
{

  programs = {
    zsh = {
      enable = lib.mkDefault true;
    };

    zoxide = {
      enable = true;
      options = [
        "--cmd cd"
      ];
    };
  };

}
