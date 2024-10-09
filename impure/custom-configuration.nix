{ pkgs, lib, inputs, ... }:

let
  fullname = "[Full Name]";
  username = "[username]";
  hostname = "[hostname]";
in
{

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "${fullname}";
    extraGroups = [ "networkmanager" "wheel" "bluetooth" ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "${username}";

  ## Networking
  networking.hostName = "${hostname}"; # Define your hostname.

}
