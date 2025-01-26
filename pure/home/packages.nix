{ lib, pkgs, ... }:
{

  fonts.fontconfig.enable = lib.mkDefault true;

  home.packages = with pkgs; [
    ## Fonts
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "MesloLG"
      ];
    })
  ];

}
