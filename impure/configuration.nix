{ pkgs, lib, inputs, ... }:

{

  imports =
    [
      ./hardware-configuration.nix
      ./custom-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "24.05";

}
