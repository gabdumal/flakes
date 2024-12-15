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
        ### Pure InitExtra definitions
        ${zshConfig}
        ### END Pure InitExtra definitions
      '';

      shellAliases = {
        # Zoxide
        cd = "z";
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };


  fonts = {
    # fontconfig = {
    #   enable = true;
    #   defaultFonts = {
    #     monospace = [ "Meslo" ];
    #   };
    # };
  };

}
