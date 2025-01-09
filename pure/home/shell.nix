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

    ## Themes
    starship = {
      enable = true;
      settings = { };
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
