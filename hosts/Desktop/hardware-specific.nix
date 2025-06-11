{ pkgs, ... }:
{
  boot.initrd.availableKernelModules = [
    "usb_storage"
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;

  # fileSystems."/media/512-GB-SSD" = {
  #   device = "/dev/disk/by-uuid/ae015b22-1795-4bda-8f60-8a06cbf39d5a";
  #   fsType = "ext4";
  # };

  # fileSystems."/media/2-TB-HDD" = {
  #   device = "/dev/disk/by-uuid/54aecc51-ae04-4c6f-ad5c-1b8791c47dae";
  #   fsType = "ext4";
  # };
}
