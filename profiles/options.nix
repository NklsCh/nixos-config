{ lib, ... }:

with lib;

{
  options.specs = {
    gpu = {
      enable = mkEnableOption "Enable GPU support";
      brand = mkOption {
        type = types.enum [
          "nvidia"
          "amd"
          "intel"
        ];
        default = "none";
        description = "GPU brand/vendor";
      };
    };

    boot.isDevDrive = mkEnableOption "Enable whether dev or nvme drive";
  };
}
