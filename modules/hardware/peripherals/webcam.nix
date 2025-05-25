{ pkgs, config, ... }:
let
  webcam-conf = pkgs.writeScriptBin "my-configure-webcam" ''
    # UGREEN 2K Webcam
    v4l2-ctl --set-ctrl=brightness=-30
    v4l2-ctl --set-ctrl=contrast=41
    v4l2-ctl --set-ctrl=saturation=80
    v4l2-ctl --set-ctrl white_balance_automatic=0
    v4l2-ctl --set-fmt-video=width=2560,height=1440,pixelformat=MJPG
  '';
in
{
  environment.systemPackages = with pkgs; [
    v4l-utils
    ffmpeg
  ];

  security.polkit.enable = true;

  systemd.user.services.webcam-conf = {
    description = "Overwrite webcam default settings";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${webcam-conf}/bin/my-configure-webcam";
      RemainAfterExit = true;
      StandardOutput = "journal";
    };
  };

  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = [
    config.boot.kernelPackages.v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
}
