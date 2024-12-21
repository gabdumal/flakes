{ pkgs, ... }:
{

  home.packages = with pkgs; [
    ## GNOME
    citations
    collision
    dconf-editor
    eyedropper
    hieroglyphic
    lorem
    switcheroo
    textpieces
    wike

    ## GNOME Extensions
    gnomeExtensions.appindicator
    gnomeExtensions.rounded-window-corners-reborn

    ## Multimedia
    ffmpeg
    imagemagick
    meld

    ## Office
    libreoffice

    ## Programming
    vscode-fhs
    zed-editor

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
