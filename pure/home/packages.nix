{ pkgs, ... }:
let
  vsCodeSettings = builtins.fromJSON (builtins.readFile ./files/.config/Code/User/settings.json);
in
{

  home.packages = with pkgs; [
    ## GNOME
    citations
    collision
    dconf-editor
    eyedropper
    hieroglyphic
    lorem
    switcheroo
    textpieces
    wike

    ## GNOME Extensions
    gnomeExtensions.appindicator
    gnomeExtensions.rounded-window-corners-reborn

    ## Multimedia
    ffmpeg
    imagemagick
    meld

    ## Office
    libreoffice

    ## Programming
    zed-editor

    ## System
    adw-gtk3
    menulibre

    ## Web
    chromium
    (pkgs.wrapFirefox
      (pkgs.firefox-unwrapped.override
        { pipewireSupport = true; })
      { })
  ];

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    neovim = {
      enable = true;
    };

    vscode = {
      enable = true;
      enableUpdateCheck = false;
      mutableExtensionsDir = true;
      userSettings = vsCodeSettings;
    };
  };

}
