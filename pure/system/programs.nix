{ pkgs, ... }:
{

  programs = {
    git = {
      enable = true;
    };

    noisetorch.enable = true;

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