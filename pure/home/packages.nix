{ pkgs, ... }:
{

  home.packages = with pkgs; [
    ## GNOME
    dconf-editor
    eyedropper
    switcheroo

    ## Office
    libreoffice

    ## System
    adw-gtk3
    menulibre

    ## Web
    (pkgs.wrapFirefox
      (pkgs.firefox-unwrapped.override {
        pipewireSupport = true;
      })
      { })
  ];

}
