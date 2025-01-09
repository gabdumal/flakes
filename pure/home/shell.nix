{ pkgs, ... }:
let
  zshConfig = builtins.readFile files/.zshrc;
in
{

  home.packages = with pkgs; [
    ## Shell
    oh-my-posh
  ];

  programs = {
    zsh = {
      enable = true;
      defaultKeymap = "viins";

      enableCompletion = true;
      enableVteIntegration = true;

      autosuggestion = {
        enable = true;
      };
      syntaxHighlighting = {
        enable = true;
      };

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
      };

      initExtra = ''
        ### Pure Home InitExtra definitions
        ${zshConfig}
        ### END Pure Home InitExtra definitions
      '';

      shellAliases = {
        ## Zoxide
        cd = "z";
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };

}
