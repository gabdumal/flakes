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
    nerd-fonts.fira-code
    nerd-fonts.meslo-lg
    nerd-fonts.martian-mono
    nerd-fonts.space-mono
    raleway
  ];

  environment.systemPackages = with pkgs; [
    ## Multimedia
    ffmpeg

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
