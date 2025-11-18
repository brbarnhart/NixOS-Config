# bootloader.nix
{ config, pkgs, lib, ... }:

{
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
  };
  
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi";
  };

  boot.loader.timeout = 20;
  #boot.loader.systemd-boot.configurationLimit = 10;
}
