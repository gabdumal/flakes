{ lib, ... }:
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
        direnv hook fish | source
      '';
      plugins = [
      ];
      functions = { };
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
