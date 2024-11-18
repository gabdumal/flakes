{ pkgs, ... }:
let
  vsCodeSettings = builtins.fromJSON (builtins.readFile ./files/.config/Code/User/settings.json);
in
{

  home.packages = with pkgs; [
    adw-gtk3

    ## GNOME
    alacarte
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

    ## Web
    (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) { })
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
