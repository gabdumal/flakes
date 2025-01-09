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
        { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      ];
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
