{ pkgs, lib, ... }:
{

  dconf.settings = {
    "org/gnome/Console" = {
      theme = lib.mkDefault "auto";
    };

    "org/gnome/desktop/interface" = {
      color-scheme = lib.mkDefault "default";
      enable-hot-corners = lib.mkDefault false;
      gtk-theme = lib.mkDefault "adw-gtk3";
      monospace-font-name = lib.mkDefault "'MesloLGL Nerd Font Mono 12'";
    };

    "org/gnome/desktop/session" = {
      idle-delay = lib.mkDefault (lib.hm.gvariant.mkUint32 900);
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = lib.mkDefault true;
      edge-tiling = lib.mkDefault true;
      workspaces-only-on-primary = lib.mkDefault true;
    };

    # "org/gnome/settings-daemon/plugins/media-keys" = {
    #   custom-keybindings = lib.mkDefault [
    #     "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
    #     "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
    #   ];
    # };

    # "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = lib.mkDefault {
    #   name = "System Monitor";
    #   binding = "<Ctrl><Shift>Escape";
    #   command = "gnome-system-monitor";
    # };
    # "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = lib.mkDefault {
    #   name = "Terminal";
    #   binding = "<Ctrl><Alt>t";
    #   command = "kgx";
    # };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = lib.mkDefault "blank";
    };

    "org/gnome/shell" = {
      disable-user-extensions = lib.mkDefault false;
      enabled-extensions = lib.mkDefault (
        with pkgs.gnomeExtensions; [
        ]
      );
      favorite-apps = lib.mkDefault [
        "firefox.desktop"
        "code.desktop"
        "org.gnome.Nautilus.desktop"
      ];
      last-selected-power-profile = lib.mkDefault "performance";
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = lib.mkDefault true;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = lib.mkDefault false;
    };
  };

}
