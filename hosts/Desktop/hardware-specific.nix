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

  fileSystems."/media/2-TB-SSD" = {
    device = "/dev/disk/by-uuid/68f628bc-5fa0-4ea3-95be-afc5f9529364";
    fsType = "ext4";
  };
}
