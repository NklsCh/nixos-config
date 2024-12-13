{ lib, ... }:
with lib;
{
  options = {
    system = {
      gpu = {
        enable = mkEnableOption "Enable GPU support";
        brand = mkOption {
          type = types.enum [
            "nvidia"
            "amd"
            "intel"
            "none"
          ];
          default = "none";
          description = "GPU brand/vendor";
        };
      };

      boot = {
        isDevDrive = mkEnableOption "Enable whether dev or nvme drive";
      };

      profiles = {
        developer = mkEnableOption "Enable development tools and configurations";
        gaming = mkEnableOption "Enable gaming-related configurations";
      };
    };
  };
}
