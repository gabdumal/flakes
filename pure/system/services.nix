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

    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
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
