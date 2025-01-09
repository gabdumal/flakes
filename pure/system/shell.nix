{ lib, pkgs, ... }: {

  users.defaultUserShell = lib.mkDefault pkgs.zsh;
  environment.localBinInPath = lib.mkDefault true;

  programs.zsh = {
    enable = lib.mkDefault true;

    autosuggestions = {
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
  };

}
