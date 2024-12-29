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

      "org/gnome/shell" = {
        disable-user-extensions = lib.mkForce false;
        enabled-extensions = with pkgs.gnomeExtensions; [

        ];
        favorite-apps = lib.mkForce [
          "firefox.desktop"
          "code.desktop"
          "org.gnome.Nautilus.desktop"
        ];
        last-selected-power-profile = lib.mkForce "performance";
      };

    };
  };

  programs.gnome-terminal = {
    enable = true;
    profile = {

      ## Astrodark
      "3a45cd64-9b3f-4bd8-b00f-56fa19be9cce" = {
        default = false;
      };

      ## Kibble
      "4ea33fe1-309b-4c8c-ae48-b348d71637d9" = {
        default = false;
      };

      ## Catppuccin Macchiato
      "5083e06b-024e-46be-9cd2-892b814f1fc8" = {
        default = false;
      };

      ## Catppuccin Frappe
      "71a9971e-e829-43a9-9b2f-4565c855d664" = {
        default = false;
      };

      ## Catppuccin Mocha
      "95894cfd-82f7-430d-af6e-84d168bc34f5" = {
        default = false;
      };

      ## Catppuccin Latte
      de8a9081-8352-4ce4-9519-5de655ad9361 = {
        default = true;
      };

    };
  };

}
