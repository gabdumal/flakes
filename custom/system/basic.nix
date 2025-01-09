{ pkgs, fullname, username, hostname, ... }:
{

  imports = [
    ./hardware-configuration.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "${fullname}";
    extraGroups = [ "networkmanager" "wheel" "bluetooth" "libvirtd" "kvm" "qemu-libvirtd" "docker" "podman" ];
  };

  # Enable automatic login for the user.
  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = "${username}";

  ## Networking
  networking.hostName = "${hostname}"; # Define your hostname.

}
