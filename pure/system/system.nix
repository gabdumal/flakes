{ pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  imports = [
    ./display.nix
    ./locales.nix
    ./machine.nix
    ./networking.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./variables.nix
  ];

  system.stateVersion = "24.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.defaultUserShell = pkgs.zsh;

  ## Privileges
  security.polkit.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  ## Pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    ## If you want to use JACK applications, uncomment this.
    #jack.enable = true;

    ## Use the example session manager (no others are packaged yet so this is enabled by default, no need to redefine it in your config for now).
    #media-session.enable = true;
  };

  ## Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229.
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  ## Some programs need SUID wrappers, can be configured further or are started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  ## Enable the OpenSSH daemon.
  # services.openssh.enable = true;

}
