{ pkgs, ... }:
{
  boot.initrd.availableKernelModules = [
    "usb_storage"
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
}
