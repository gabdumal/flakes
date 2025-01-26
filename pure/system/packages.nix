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
  ];

}
