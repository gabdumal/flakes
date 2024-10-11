{ pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    webcord
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };

}
