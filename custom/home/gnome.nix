{ lib, pkgs, ... }:
{

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = lib.mkForce "default";
      };

      "org/gnome/desktop/session" = {
        idle-delay = lib.mkForce (lib.hm.gvariant.mkUint32 0);
      };

      "org/gnome/mutter" = {
        dynamic-workspaces = lib.mkForce true;
        edge-tiling = lib.mkForce true;
        workspaces-only-on-primary = lib.mkForce true;
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
        disable-user-extensions = lib.mkForce false;
        enabled-extensions = with pkgs.gnomeExtensions; [
        ];
        favorite-apps = lib.mkForce [
          "firefox.desktop"
          "code.desktop"
          "org.gnome.Nautilus.desktop"
        ];
        # last-selected-power-profile = lib.mkForce "performance";
      };
    };
  };

}
