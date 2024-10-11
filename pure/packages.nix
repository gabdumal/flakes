{ pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
    fastfetch
    (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) { })
    nil
    nixpkgs-fmt
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

    neovim = {
      enable = true;
    };
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Meslo" ]; })
  ];

}
