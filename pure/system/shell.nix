{ lib, pkgs, ... }: {

  users.defaultUserShell = pkgs.zsh;
  environment.localBinInPath = lib.mkDefault true;

}
