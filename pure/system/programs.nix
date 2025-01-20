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
      config = {
        init = {
          defaultBranch = "main";
        };
      };
    };

    ## System
    nautilus-open-any-terminal = {
      enable = lib.mkDefault true;
      terminal = lib.mkDefault "ghostty";
    };

    neovim = {
      enable = lib.mkDefault true;
    };

    nix-ld = {
      enable = lib.mkDefault false;
      libraries = with pkgs; [
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
