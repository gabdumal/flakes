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
    appimage-run
    bluez
    bluez-tools
    fastfetch
    gnome-terminal
    nil
    nixpkgs-fmt
    qbittorrent
    remmina
    thefuck
    usbutils
    wget
    zed-editor
  ];

}
