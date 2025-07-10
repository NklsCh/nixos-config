{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/disk/by-id/nvme-Samsung_SSD_990_EVO_Plus_2TB_S7U7NU0Y428877L";
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
    };
  };
}
