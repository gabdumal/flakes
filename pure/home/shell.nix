{ lib, ... }:
let
  nixHelperCommands = builtins.readFile files/nixHelperCommands.sh;
in
{

  programs = {
    ## Shells
    fish = {
      enable = lib.mkDefault true;
      shellInit = lib.mkDefault ''
        set fish_greeting # Disable greeting
        direnv hook fish | source # Enable direnv
      '';
      interactiveShellInit = lib.mkDefault ''
        thefuck --alias | source # Enable thefuck
      '';
    };

    zsh = {
      enable = lib.mkDefault true;
      initExtra = lib.mkDefault ''
        ${nixHelperCommands}
      '';
      autosuggestion = {
        enable = lib.mkDefault true;
      };
      syntaxHighlighting = {
        enable = lib.mkDefault true;
      };
      oh-my-zsh = {
        enable = lib.mkDefault true;
        plugins = lib.mkDefault [ "git" ];
        theme = lib.mkDefault "robbyrussell";
      };
    };

    ## Themes
    starship = {
      enable = lib.mkDefault true;
    };

    ## Tools
    fzf = {
      enable = lib.mkDefault true;
    };

    thefuck = {
      enable = lib.mkDefault true;
    };

    zoxide = {
      enable = true;
      options = lib.mkDefault [
        "--cmd cd"
      ];
    };
  };

}
