{ ... }:
{

  environment.sessionVariables = {
    ## Use Wayland on Chromium and Electron
    NIXOS_OZONE_WL = "1";
  };

}
