{ lib, ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  imports = [
    ./display.nix
    ./environment.nix
    ./locales.nix
    ./machine.nix
    ./networking.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./shell.nix
  ];

  system.stateVersion = "24.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ## CUPS, to print documents
  services.printing.enable = lib.mkDefault false;

  ## OpenSSH daemon
  services.openssh.enable = lib.mkDefault true;

  ## Pipewire
  services.pulseaudio.enable = lib.mkDefault false;
  security.rtkit.enable = lib.mkDefault true;
  services.pipewire = {
    enable = lib.mkDefault true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    ### If you want to use JACK applications, uncomment this.
    #jack.enable = true;

    ### Use the example session manager (no others are packaged yet so this is enabled by default, no need to redefine it in your config for now).
    #media-session.enable = true;
  };

  ## Privileges
  security.polkit.enable = true;

  ## Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229.
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

}
