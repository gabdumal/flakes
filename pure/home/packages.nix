{ pkgs, ... }:
{

  home.packages = with pkgs; [
    (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) { })
    adw-gtk3
    ffmpeg
    imagemagick
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
    };
  };

}
