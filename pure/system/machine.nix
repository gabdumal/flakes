{ config, lib, pkgs, ... }:
{

  ## Bootloader.
  boot.loader.systemd-boot.enable = lib.mkDefault true;
  boot.loader.efi.canTouchEfiVariables = lib.mkDefault true;

  ## Kernel
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  ### Enable the V4L2 loopback kernel module for OBS
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];

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
