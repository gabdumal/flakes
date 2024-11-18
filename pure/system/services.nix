{ pkgs, ... }:
{

  services = {
    flatpak = {
      enable = true;
    };

    logind = {
      powerKey = "hybrid-sleep";
      powerKeyLongPress = "poweroff";
    };

    xrdp = {
      defaultWindowManager = "${pkgs.gnome-session}/bin/gnome-session";
      enable = true;
      openFirewall = true;
    };
  };

  systemd = {
    targets = {
      sleep.enable = true;
      suspend.enable = true;
      hibernate.enable = true;
      hybrid-sleep.enable = true;
    };
  };

}
