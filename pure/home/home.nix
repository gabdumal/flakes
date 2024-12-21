{ ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  imports = [
    ./dotfiles.nix
    ./gnome.nix
    ./packages.nix
    ./programs.nix
    ./shell.nix
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

}
