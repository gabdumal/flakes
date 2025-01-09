{ lib, ... }:
let
  zshConfig = builtins.readFile files/.zshrc;
in
{

  programs = {
    zsh = {
      enable = true;
      defaultKeymap = lib.mkDefault "viins";

      autosuggestion = {
        enable = lib.mkDefault true;
      };
      syntaxHighlighting = {
        enable = lib.mkDefault true;
      };

      oh-my-zsh = {
        enable = lib.mkDefault true;
        plugins = [ "git" ];
      };

      shellAliases = {
        ## Zoxide
        cd = lib.mkDefault "z";
      };

      initExtra = ''
        ### Pure Home Extra definitions
        ${zshConfig}
        ### END Pure Home Extra definitions
      '';
    };

    zoxide = {
      enable = true;
    };
  };

}
