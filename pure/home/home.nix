{ ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  imports = [
    ./dotfiles.nix
    ./gnome.nix
    ./packages.nix
    ./shell.nix
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  catppuccin = {
    enable = true;
    flavor = "latte";
  };

}
