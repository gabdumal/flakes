{ pkgs, lib, ... }:
{

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "default";
      enable-hot-corners = false;
      gtk-theme = "adw-gtk3";
    };

    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 900;
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
      sleep-inactive-ac-type = "blank";
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
      "71a9971e-e829-43a9-9b2f-4565c855d664" = {
        allowBold = true;
        audibleBell = true;
        backspaceBinding = "ascii-delete";
        boldIsBright = false;
        colors = {
          backgroundColor = "#303446";
          cursor = {
            background = "#f2d5cf";
            foreground = "#303446";
          };
          foregroundColor = "#c6d0f5";
          highlight = {
            background = "#f2d5cf";
            foreground = "#626880";
          };
          palette = [
            "#51576d"
            "#e78284"
            "#a6d189"
            "#e5c890"
            "#8caaee"
            "#f4b8e4"
            "#81c8be"
            "#a5adce"
            "#626880"
            "#e67172"
            "#8ec772"
            "#d9ba73"
            "#7b9ef0"
            "#f2a4db"
            "#5abfb5"
            "#b5bfe2"
          ];
        };
        cursorBlinkMode = "system";
        cursorShape = "block";
        default = false;
        deleteBinding = "delete-sequence";
        font = "MesloLGS Nerd Font Mono 16";
        scrollOnOutput = true;
        scrollbackLines = 10000;
        showScrollbar = true;
        transparencyPercent = 0;
        visibleName = "Catppuccin Frappe";
      };
      "5083e06b-024e-46be-9cd2-892b814f1fc8" = {
        allowBold = true;
        audibleBell = true;
        backspaceBinding = "ascii-delete";
        boldIsBright = false;
        colors = {
          backgroundColor = "#24273a";
          cursor = {
            background = "#f4dbd6";
            foreground = "#24273a";
          };
          foregroundColor = "#cad3f5";
          highlight = {
            background = "#f4dbd6";
            foreground = "#5b6078";
          };
          palette = [
            "#494d64"
            "#ed8796"
            "#a6da95"
            "#eed49f"
            "#8aadf4"
            "#f5bde6"
            "#8bd5ca"
            "#a5adcb"
            "#5b6078"
            "#ec7486"
            "#8ccf7f"
            "#e1c682"
            "#78a1f6"
            "#f2a9dd"
            "#63cbc0"
            "#b8c0e0"
          ];
        };
        cursorBlinkMode = "system";
        cursorShape = "block";
        default = false;
        deleteBinding = "delete-sequence";
        font = "MesloLGS Nerd Font Mono 16";
        scrollOnOutput = true;
        scrollbackLines = 10000;
        showScrollbar = true;
        transparencyPercent = 0;
        visibleName = "Catppuccin Macchiato";
      };
      "95894cfd-82f7-430d-af6e-84d168bc34f5" = {
        allowBold = true;
        audibleBell = true;
        backspaceBinding = "ascii-delete";
        boldIsBright = false;
        colors = {
          backgroundColor = "#1e1e2e";
          cursor = {
            background = "#f5e0dc";
            foreground = "#1e1e2e";
          };
          foregroundColor = "#cdd6f4";
          highlight = {
            background = "#f5e0dc";
            foreground = "#585b70";
          };
          palette = [
            "#45475a"
            "#f38ba8"
            "#a6e3a1"
            "#f9e2af"
            "#89b4fa"
            "#f5c2e7"
            "#94e2d5"
            "#a6adc8"
            "#585b70"
            "#f37799"
            "#89d88b"
            "#ebd391"
            "#74a8fc"
            "#f2aede"
            "#6bd7ca"
            "#bac2de"
          ];
        };
        cursorBlinkMode = "system";
        cursorShape = "block";
        default = false;
        deleteBinding = "delete-sequence";
        font = "MesloLGS Nerd Font Mono 16";
        scrollOnOutput = true;
        scrollbackLines = 10000;
        showScrollbar = true;
        transparencyPercent = 0;
        visibleName = "Catppuccin Mocha";
      };
    };
  };

}
