{ lib, pkgs, ... }:
{

  programs = {
    ## Shells
    zsh = {
      enable = lib.mkDefault true;
    };

    fish = {
      enable = lib.mkDefault true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
        thefuck --alias | source
      '';
      plugins = [
      ];
      functions = { };
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
