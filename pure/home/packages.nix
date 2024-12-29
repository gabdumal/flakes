{ pkgs, ... }:
{

  home.packages = with pkgs; [
    ## GNOME
    dconf-editor
    eyedropper
    switcheroo

    ## Multimedia
    imagemagick
    qbittorrent

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
