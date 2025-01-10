{ lib, pkgs, ... }:
let
  nixHelperCommands = builtins.readFile files/nixHelperCommands.sh;
in
{

  users.defaultUserShell = pkgs.zsh;
  environment.localBinInPath = lib.mkDefault true;

  programs = {
    ## Shells
    zsh = {
      enable = true;
      shellInit = ''
        ${nixHelperCommands}
      '';
      autosuggestions = {
        enable = lib.mkDefault true;
      };
      syntaxHighlighting = {
        enable = lib.mkDefault true;
      };
      ohMyZsh = {
        enable = lib.mkDefault true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
    };

    fish = {
      enable = lib.mkDefault true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
        thefuck --alias | source
        direnv hook fish | source
      '';
    };

    ## Tools
    fzf = {
      fuzzyCompletion = lib.mkDefault true;
      keybindings = lib.mkDefault true;
    };

    thefuck = {
      enable = lib.mkDefault true;
    };
  };

}
