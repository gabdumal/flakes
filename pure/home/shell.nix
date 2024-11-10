{ pkgs, ... }:
let
  zshConfig = builtins.readFile files/.zshrc;
in
{

  home.packages = with pkgs; [
    oh-my-posh
  ];

  programs.zsh = {
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
      ### Pure InitExtra definitions
      ${zshConfig}
      ### END Pure InitExtra definitions
    '';

    sessionVariables = { };

    shellAliases = {
      # Zoxide
      cd = "z";
    };

  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Meslo" ];
      };
    };
  };

}
