{ config, lib, ... }:

with lib;
let
  cfg = config.specs;
in
{
  config = mkIf (cfg.gpu.enable && cfg.gpu.brand == "nvidia") {
    services.xserver.videoDrivers = [ "nvidia" ];

    boot.kernelModules = [ "nvidia-uvm" ];

    nixpkgs.config = {
      cudaSupport = true;
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
