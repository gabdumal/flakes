{ pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-connections
    gnome-console
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "Meslo"
        "FiraCode"
      ];
    })
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
    jetbrains-toolbox
    temurin-bin

    ## System
    bluez
    bluez-tools
    curl
    usbutils
    wget

    ## Terminal
    fastfetch
    gnome-terminal
    thefuck
  ];

}
