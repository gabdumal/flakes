{ pkgs, ... }:
let
  sshKnownHosts = builtins.readFile ./.ssh/known_hosts;
in
{

  imports = [
    ./shell.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  home.file = {
    ".ssh/known_hosts" = {
      text = "${sshKnownHosts}";
    };

    ".dotfiles/omp.json" = {
      text = "";
    };
  };

  home.packages = with pkgs; [
    (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true; }) { })
    itch
    webcord
    zed-editor
    ## GNOME
    alacarte
    citations
    collision
    dconf-editor
    eyedropper
    hieroglyphic
    lorem
    textpieces
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

    zsh = {
      enable = true;
      initExtra = ''
        ### Impure InitExtra definitions
          eval "$(oh-my-posh init zsh --config ~/.dotfiles/omp.json)"
        ### END Impure InitExtra definitions
      '';
    };

    vscode = {
      enable = true;
      mutableExtensionsDir = true;
    };
  };

}
