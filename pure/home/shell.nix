{ lib, ... }:
let
  zshConfig = builtins.readFile files/.zshrc;
in
{

  programs = {
    zsh = {
      defaultKeymap = lib.mkDefault "viins";
      enableVteIntegration = lib.mkDefault true;
      initExtra = ''
        ### Pure Home InitExtra definitions
        ${zshConfig}
        ### END Pure Home InitExtra definitions
      '';
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };

}
