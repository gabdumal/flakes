{ pkgs, ... }:
let
  vsCodeSettings = builtins.fromJSON (builtins.readFile ./files/.config/Code/User/settings.json);
in
{

  home.packages = with pkgs; [
    (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) { })

    adw-gtk3
    ffmpeg
    imagemagick
    meld
    libreoffice

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
    gnomeExtensions.rounded-window-corners-reborn
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
