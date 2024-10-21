{ pkgs, ... }:
{

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "default";
      enable-hot-corners = false;
      gtk-theme = "adw-gtk3";
    };
    "org/gnome/desktop/session" = {
      idle-delay = "uint32 0";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Terminal";
      command = "gnome-terminal";
      binding = "<Ctrl><Alt>t";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "System Monitor";
      command = "gnome-system-monitor";
      binding = "<Ctrl><Shift>Escape";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        rounded-window-corners-reborn.extensionUuid
      ];
      favorite-apps = [
        "firefox.desktop"
        "code.desktop"
        "org.gnome.Nautilus.desktop"
      ];
      last-selected-power-profile = "performance";
    };
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
  };

  programs.gnome-terminal = {
    enable = true;
    showMenubar = false;
    themeVariant = "system";
    profile = {
      de8a9081-8352-4ce4-9519-5de655ad9361 = {
        allowBold = true;
        audibleBell = true;
        backspaceBinding = "ascii-delete";
        boldIsBright = false;
        colors = {
          backgroundColor = "#eff1f5";
          cursor = {
            background = "#dc8a78";
            foreground = "#eff1f5";
          };
          foregroundColor = "#4c4f69";
          highlight = {
            background = "#dc8a78";
            foreground = "#4c4f69";
          };
          palette = [
            "#5c5f77"
            "#d20f39"
            "#40a02b"
            "#df8e1d"
            "#1e66f5"
            "#ea76cb"
            "#179299"
            "#acb0be"
            "#6c6f85"
            "#d20f39"
            "#40a02b"
            "#df8e1d"
            "#1e66f5"
            "#ea76cb"
            "#179299"
            "#bcc0cc"
          ];
        };
        cursorBlinkMode = "system";
        cursorShape = "block";
        default = true;
        deleteBinding = "delete-sequence";
        font = "MesloLGS Nerd Font Mono 16";
        scrollOnOutput = true;
        scrollbackLines = 10000;
        showScrollbar = true;
        transparencyPercent = 0;
        visibleName = "Catppuccin Latte";
      };
    };
  };

}
