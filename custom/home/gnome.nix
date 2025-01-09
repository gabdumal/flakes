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

      "org/gnome/shell" = {
        disable-user-extensions = lib.mkDefault false;
        enabled-extensions = with pkgs.gnomeExtensions; [

        ];
        favorite-apps = lib.mkDefault [
          "firefox.desktop"
          "code.desktop"
          "org.gnome.Nautilus.desktop"
        ];
        # last-selected-power-profile = lib.mkDefault "performance";
      };

    };
  };

  programs.gnome-terminal = {
    profile = {
      ## Astrodark
      "3a45cd64-9b3f-4bd8-b00f-56fa19be9cce" = {
        default = lib.mkDefault false;
      };

      ## Kibble
      "4ea33fe1-309b-4c8c-ae48-b348d71637d9" = {
        default = lib.mkDefault false;
      };

      ## Catppuccin Macchiato
      "5083e06b-024e-46be-9cd2-892b814f1fc8" = {
        default = lib.mkDefault false;
      };

      ## Catppuccin Frappe
      "71a9971e-e829-43a9-9b2f-4565c855d664" = {
        default = lib.mkDefault false;
      };

      ## Catppuccin Mocha
      "95894cfd-82f7-430d-af6e-84d168bc34f5" = {
        default = lib.mkDefault false;
      };

      ## Catppuccin Latte
      de8a9081-8352-4ce4-9519-5de655ad9361 = {
        default = lib.mkDefault true;
      };
    };
  };

}
