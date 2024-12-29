{ lib, ... }:
{

  # Select internationalisation properties.
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";

  i18n.extraLocaleSettings = lib.mkDefault {
    LC_ADDRESS = lib.mkDefault "pt_BR.UTF-8";
    LC_IDENTIFICATION = lib.mkDefault "pt_BR.UTF-8";
    LC_MEASUREMENT = lib.mkDefault "pt_BR.UTF-8";
    LC_MONETARY = lib.mkDefault "pt_BR.UTF-8";
    LC_NAME = lib.mkDefault "pt_BR.UTF-8";
    LC_NUMERIC = lib.mkDefault "pt_BR.UTF-8";
    LC_PAPER = lib.mkDefault "pt_BR.UTF-8";
    LC_TELEPHONE = lib.mkDefault "pt_BR.UTF-8";
    LC_TIME = lib.mkDefault "pt_BR.UTF-8";
  };

  # Configure keymap in X11.
  services.xserver.xkb = {
    layout = lib.mkDefault "us";
    variant = lib.mkDefault "intl";
  };

  console.keyMap = lib.mkDefault "us-acentos";

}
