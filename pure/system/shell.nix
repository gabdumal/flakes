{ lib, pkgs, ... }:
{

  users.defaultUserShell = pkgs.zsh;
  environment.localBinInPath = lib.mkDefault true;

  programs = {
    ## Shells
    fish = {
      enable = lib.mkDefault true;
    };

    zsh = {
      enable = true;
    };
  };

}
