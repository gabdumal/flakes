{ username, ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

}
