{ pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-console
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Meslo" ]; })
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
    thefuck
    usbutils
    zed-editor
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

  ## Allow AppImage files to be run seamlessly
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

}
