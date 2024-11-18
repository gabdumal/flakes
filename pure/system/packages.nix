{ pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-console
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Meslo" ]; })
    montserrat
    raleway
  ];

  environment.systemPackages = with pkgs; [
    ## Multimedia
    qbittorrent

    ## Nix
    appimage-run
    nil
    nixpkgs-fmt

    ## Programming
    zed-editor

    ## System
    bluez
    bluez-tools
    usbutils
    wget

    ## Terminal
    fastfetch
    gnome-terminal
    thefuck

    ## Web
    chromium
  ];

}
