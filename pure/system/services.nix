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

    udev.packages = with pkgs; [ gnome-settings-daemon ];

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
