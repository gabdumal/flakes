{ lib, pkgs, ... }:
{

  fonts.fontconfig.enable = lib.mkDefault true;

  home.packages = with pkgs; [
    ## Fonts
    nerd-fonts.fira-code
    nerd-fonts.meslo-lg

    ## GNOME
    nautilus-python

    ## Multimedia
    ffmpeg
    imagemagick
    qbittorrent

    ## Nix
    appimage-run
    nil
    nixpkgs-fmt

    ## Programming
    vscode-fhs
    zed-editor

    ## Shell
    fastfetch
    fzf

    ## System
    adw-gtk3 # Port GTK3 apps to libadwaita
    bluez # Bluetooth
    bluez-tools # Bluetooth tools
    curl # HTTP client
    direnv # Environment switcher
    menulibre # Menu editor
    neovim # Text editor
    usbutils # USB tools
    wget # HTTP client

    ## Web
    (pkgs.wrapFirefox
      (pkgs.firefox-unwrapped.override {
        pipewireSupport = true;
      })
      { })
  ];

}
