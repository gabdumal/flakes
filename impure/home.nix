{ config, pkgs, ... }:
let
  username = "[username]";
in
{

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  dconf.settings."org/gnome/Console" = {
    use-system-font = false;
    custom-font = "MesloLGS Nerd Font Mono 14";
  };

}
