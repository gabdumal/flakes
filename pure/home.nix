{ pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    oh-my-posh
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };

  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";

    enableCompletion = true;
    enableVteIntegration = true;

    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting =
      {
        enable = true;
      };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    initExtra = ''
      # InitExtra definitions
        if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
          eval "$(oh-my-posh init zsh)"
        fi
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

  dconf.settings."org/gnome/Console" = {
    use-system-font = false;
    custom-font = "MesloLGS Nerd Font Mono 14";
  };

}
