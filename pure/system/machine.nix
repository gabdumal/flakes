{ pkgs, ... }:
{

  ## Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ## Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  ## Filesystems
  boot.supportedFilesystems = [ "ntfs" ];

  ## Hardware configuration
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;

  ## Time
  ### Set your time zone.
  time.timeZone = "America/Sao_Paulo";
  ### Use time according to the timezone. This prevents problems with dual-booting.
  time.hardwareClockInLocalTime = true;

}
