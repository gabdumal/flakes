{ ... }:
{

  imports = [
    ./dotfiles.nix
    ./gnome.nix
    ./packages.nix
    ./shell.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  catppuccin = {
    enable = true;
    flavor = "latte";
  };

}
