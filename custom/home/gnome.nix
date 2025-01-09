{ lib, pkgs, ... }:
{

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = lib.mkDefault "default";
      };

      "org/gnome/desktop/session" = {
        idle-delay = lib.mkDefault (lib.hm.gvariant.mkUint32 0);
      };

      "org/gnome/mutter" = {
        dynamic-workspaces = lib.mkDefault true;
        edge-tiling = lib.mkDefault true;
        workspaces-only-on-primary = lib.mkDefault true;
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "System Monitor";
        binding = "<Ctrl><Shift>Escape";
        command = "gnome-system-monitor";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        name = "Terminal";
        binding = "<Ctrl><Alt>t";
        command = "ghostty";
      };

      "org/gnome/shell" = {
        disable-user-extensions = lib.mkDefault false;
        enabled-extensions = with pkgs.gnomeExtensions; [
        ];
        favorite-apps = lib.mkDefault [
          "firefox.desktop"
          "code.desktop"
          "org.gnome.Nautilus.desktop"
        ];
        last-selected-power-profile = lib.mkDefault "performance";
      };
    };
  };

}
