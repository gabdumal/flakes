{ lib, ... }:
let
  nixHelperCommands = builtins.readFile files/nixHelperCommands.sh;
in
{

  programs = {
    zsh = {
      enable = lib.mkDefault true;
      initExtra = ''
        ${nixHelperCommands}
      '';
    };

    zoxide = {
      enable = true;
    };
  };

}
