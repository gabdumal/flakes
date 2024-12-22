{ pkgs, ... }:
{

  home.packages = with pkgs; [
    ## GNOME
    dconf-editor
    eyedropper
    switcheroo

    ### Extensions

    ## Multimedia
    ffmpeg
    imagemagick

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
