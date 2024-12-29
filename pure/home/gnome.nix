{ pkgs, lib, ... }:
{

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = lib.mkDefault "default";
      enable-hot-corners = lib.mkDefault false;
      gtk-theme = lib.mkDefault "adw-gtk3";
    };

    "org/gnome/desktop/session" = {
      idle-delay = lib.mkDefault (lib.hm.gvariant.mkUint32 900);
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
      name = lib.mkDefault "Terminal";
      command = lib.mkDefault "gnome-terminal";
      binding = lib.mkDefault "<Ctrl><Alt>t";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = lib.mkDefault "System Monitor";
      command = lib.mkDefault "gnome-system-monitor";
      binding = lib.mkDefault "<Ctrl><Shift>Escape";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = lib.mkDefault "blank";
    };

    "org/gnome/shell" = {
      disable-user-extensions = lib.mkDefault false;
      enabled-extensions = with pkgs.gnomeExtensions; [

      ];
      favorite-apps = [
        "firefox.desktop"
        "code.desktop"
        "org.gnome.Nautilus.desktop"
      ];
      last-selected-power-profile = lib.mkDefault "performance";
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = lib.mkDefault true;
    };
  };

  programs.gnome-terminal = {
    enable = lib.mkDefault true;
    showMenubar = lib.mkDefault false;
    themeVariant = lib.mkDefault "system";
    profile = {
      "3a45cd64-9b3f-4bd8-b00f-56fa19be9cce" = {
        allowBold = true;
        audibleBell = true;
        backspaceBinding = "ascii-delete";
        boldColor = "#9B9B9F9FA9A9";
        boldIsBright = false;
        colors = {
          backgroundColor = "#1A1A1D1D2323";
          cursor = {
            background = "#CACACCCCD3D3";
            foreground = "#1A1A1D1D2323";
          };
          foregroundColor = "#9B9B9F9FA9A9";
          palette = [
            "#111113131717"
            "#F8F874747E7E"
            "#7575ADAD4747"
            "#D0D092921414"
            "#5050A4A4E9E9"
            "#CCCC8383E3E3"
            "#0000B2B29898"
            "#ADADB0B0BBBB"
            "#575761617676"
            "#FAFAA5A5ABAB"
            "#A5A5CDCD8484"
            "#EFEFBDBD5858"
            "#8D8DC3C3F1F1"
            "#DEDEAEAEEDED"
            "#2727FFFFDFDF"
            "#CACACCCCD3D3"
          ];
        };
        cursorBlinkMode = "system";
        cursorShape = "block";
        deleteBinding = "delete-sequence";
        font = "MesloLGS Nerd Font Mono 16";
        scrollOnOutput = true;
        scrollbackLines = 10000;
        showScrollbar = true;
        transparencyPercent = 0;
        visibleName = "Astrodark";
      };
      "4ea33fe1-309b-4c8c-ae48-b348d71637d9" = {
        allowBold = true;
        audibleBell = true;
        backspaceBinding = "ascii-delete";
        boldColor = "#F7F7F7F7F7F7";
        boldIsBright = false;
        colors = {
          backgroundColor = "#0E0E10100A0A";
          cursor = {
            background = "#F7F7F7F7F7F7";
            foreground = "#0E0E10100A0A";
          };
          foregroundColor = "#F7F7F7F7F7F7";
          highlight = {
            background = "#dc8a78";
            foreground = "#4c4f69";
          };
          palette = [
            "#4D4D4D4D4D4D"
            "#C7C700003131"
            "#2929CFCF1313"
            "#D8D8E3E30E0E"
            "#34344949D1D1"
            "#84840000FFFF"
            "#07079898ABAB"
            "#E2E2D1D1E3E3"
            "#5A5A5A5A5A5A"
            "#F0F015157878"
            "#6C6CE0E05C5C"
            "#F3F3F7F79E9E"
            "#9797A4A4F7F7"
            "#C4C49595F0F0"
            "#6868F2F2E0E0"
            "#FFFFFFFFFFFF"
          ];
        };
        cursorBlinkMode = "system";
        cursorShape = "block";
        deleteBinding = "delete-sequence";
        font = "MesloLGS Nerd Font Mono 16";
        scrollOnOutput = true;
        scrollbackLines = 10000;
        showScrollbar = true;
        transparencyPercent = 0;
        visibleName = "Kibble";
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
        deleteBinding = "delete-sequence";
        font = "MesloLGS Nerd Font Mono 16";
        scrollOnOutput = true;
        scrollbackLines = 10000;
        showScrollbar = true;
        transparencyPercent = 0;
        visibleName = "Catppuccin Macchiato";
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
        deleteBinding = "delete-sequence";
        font = "MesloLGS Nerd Font Mono 16";
        scrollOnOutput = true;
        scrollbackLines = 10000;
        showScrollbar = true;
        transparencyPercent = 0;
        visibleName = "Catppuccin Frappe";
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
        deleteBinding = "delete-sequence";
        font = "MesloLGS Nerd Font Mono 16";
        scrollOnOutput = true;
        scrollbackLines = 10000;
        showScrollbar = true;
        transparencyPercent = 0;
        visibleName = "Catppuccin Mocha";
      };
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
