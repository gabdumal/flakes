{ pkgs, ... }:
{

  services = {
    flatpak = {
      enable = true;
    };

    ## Power key actions
    logind = {
      powerKey = "hybrid-sleep";
      powerKeyLongPress = "poweroff";
    };

    udev = {
      packages = with pkgs; [ gnome-settings-daemon ];
    };
  };

  systemd = {
    ## Power actions on the GNOME desktop environment
    targets = {
      sleep.enable = true;
      suspend.enable = true;
      hibernate.enable = true;
      hybrid-sleep.enable = true;
    };
  };

}
