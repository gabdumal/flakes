{ pkgs, ... }:
{

  environment.gnome.excludePackages = with pkgs; [
    gnome-connections
    gnome-console
    gnome-tour
  ];

  services.xserver.excludePackages = [ pkgs.xterm ];

  fonts.packages = with pkgs; [
    montserrat
    raleway
  ];

  environment.systemPackages = with pkgs; [
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

    ## Office
    libreoffice

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
    ghostty # Terminal emulator
    menulibre # Menu editor
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
