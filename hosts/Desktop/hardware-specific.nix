{ ... }:
{
  boot.initrd.availableKernelModules = [
    "usb_storage"
  ];

  fileSystems."/media/512-GB-SSD" = {
    device = "/dev/disk/by-uuid/ae015b22-1795-4bda-8f60-8a06cbf39d5a";
    fsType = "ext4";
  };

  fileSystems."/media/2-TB-HDD" = {
    device = "/dev/disk/by-uuid/f6ceba8d-1e33-4cf3-985a-eb05074f721c";
    fsType = "ext4";
  };
}
