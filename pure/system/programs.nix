{ lib, pkgs, ... }:
{

  programs = {
    ## Multimedia
    noisetorch = {
      enable = lib.mkDefault true;
    };

    ## Programming
    direnv = {
      enable = true;
    };

    git = {
      enable = true;
    };

    ## Shell
    fzf = {
      fuzzyCompletion = lib.mkDefault true;
      keybindings = lib.mkDefault true;
    };

    thefuck = {
      enable = lib.mkDefault true;
    };

    zsh = {
      enable = lib.mkDefault true;
      enableCompletion = lib.mkDefault true;
      syntaxHighlighting.enable = lib.mkDefault true;
    };

    ## System
    gnome-terminal = {
      enable = lib.mkDefault false;
    };

    neovim = {
      enable = lib.mkDefault true;
    };

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc
        openssl
      ];
    };
  };

  ## Allow AppImage files to run seamlessly
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

}
