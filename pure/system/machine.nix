{ lib, pkgs, ... }:
{

  ## Bootloader.
  boot.loader.systemd-boot.enable = lib.mkDefault true;
  boot.loader.efi.canTouchEfiVariables = lib.mkDefault true;

  ## Kernel
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  ## Filesystems
  boot.supportedFilesystems = lib.mkDefault [ "ntfs" ];

  ## Hardware configuration
  hardware.enableAllFirmware = lib.mkDefault true;
  hardware.enableRedistributableFirmware = lib.mkDefault true;
  hardware.graphics.enable = lib.mkDefault true; # when using QEMU KVM

  ## Power management for laptops
  powerManagement.enable = lib.mkDefault true;

  ## Time
  ### Set your time zone.
  time.timeZone = lib.mkDefault "America/Sao_Paulo";
  ### Use time according to the timezone. This prevents problems with dual-booting.
  time.hardwareClockInLocalTime = lib.mkDefault false;

}
