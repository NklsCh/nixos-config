{
  disko.devices = {
    disk = {
      nvme0 = {
        device = "/dev/disk/by-id/nvme-KINGSTON_SNV2S500G_50026B7686675FC3";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              name = "nixos_EFI";
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              name = "nixos_root";
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "/@" = {
                    mountpoint = "/";
                    mountOptions = [
                      "compress=zstd"
                      "ssd"
                      "space_cache=v2"
                      "commit=120"
                    ];
                  };
                  "/@home" = {
                    mountpoint = "/home";
                    mountOptions = [
                      "compress=zstd"
                      "ssd"
                      "space_cache=v2"
                      "commit=120"
                    ];
                  };
                  "/@nix" = {
                    mountpoint = "/nix";
                    mountOptions = [
                      "compress=zstd"
                      "ssd"
                      "space_cache=v2"
                      "commit=120"
                    ];
                  };
                };
              };
            };
          };
        };
      };
      nvme1 = {
        device = "/dev/disk/by-id/nvme-Samsung_SSD_990_EVO_Plus_2TB_S7U7NU0Y428877L";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            dataPartition = {
              name = "2TB_SSD_Data";
              size = "100%";
              content = {
                type = "filesystem";
                format = "btrfs";
                mountpoint = "/media/2-TB-SSD";
              };
            };
          };
        };
      };
    };
  };
}
