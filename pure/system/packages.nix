{ pkgs, ... }:
{

  environment.gnome.excludePackages = with pkgs; [
    gnome-connections
    gnome-console
  ];

  fonts.packages = with pkgs; [
    montserrat
    nerd-fonts.fira-code
    nerd-fonts.meslo-lg
    nerd-fonts.martian-mono
    nerd-fonts.space-mono
    raleway
  ];

  environment.systemPackages = with pkgs; [
    ## Multimedia
    qbittorrent

    ## Nix
    appimage-run
    nil
    nixpkgs-fmt

    ### Jetbrains
    jetbrains.idea-ultimate

    ## Shell
    fastfetch
    gnome-terminal
    thefuck

    ## System
    bluez
    bluez-tools
    curl
    nix-ld
    usbutils
    wget
  ];

}
