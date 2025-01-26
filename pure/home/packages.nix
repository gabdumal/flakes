{ lib, pkgs, ... }:
{

  fonts.fontconfig.enable = lib.mkDefault true;

  home.packages = with pkgs; [
    ## Fonts
    nerd-fonts.fira-code
    nerd-fonts.meslo-lg
  ];

}
