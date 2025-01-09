{ lib, pkgs, ... }:
let
  nixHelperCommands = builtins.readFile files/nixHelperCommands.sh;
in
{

  users.defaultUserShell = pkgs.zsh;
  environment.localBinInPath = lib.mkDefault true;

  programs = {
    zsh = {
      enable = true;
      shellInit = ''
        ${nixHelperCommands}
      '';
    };

    fzf = {
      fuzzyCompletion = lib.mkDefault true;
      keybindings = lib.mkDefault true;
    };

    thefuck = {
      enable = lib.mkDefault true;
    };
  };

}
