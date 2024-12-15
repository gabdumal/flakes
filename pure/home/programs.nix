{ ... }:
let
  vsCodeSettings = builtins.fromJSON (builtins.readFile ./files/.config/Code/User/settings.json);
in
{

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    neovim = {
      enable = true;
    };

    vscode = {
      enable = true;
      enableUpdateCheck = false;
      mutableExtensionsDir = true;
      userSettings = vsCodeSettings;
    };
  };

}
