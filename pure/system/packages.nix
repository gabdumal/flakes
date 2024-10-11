{ pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-console
  ];

  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
    fastfetch
    nil
    nixpkgs-fmt
    usbutils
    gnome-terminal
  ];

  programs = {
    git = {
      enable = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
    };
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Meslo" ]; })
  ];

}
