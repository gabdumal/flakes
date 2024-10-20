{ pkgs, ... }:
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
        if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
          eval "$(oh-my-posh init zsh)"
        fi
        eval "$(oh-my-posh init zsh --config ~/.dotfiles/omp.json)"
        eval $(thefuck --alias)
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
