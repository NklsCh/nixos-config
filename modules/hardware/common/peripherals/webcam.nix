{ pkgs, ... }:
let
  webcam-conf = pkgs.writeScriptBin "my-configure-webcam" ''
    # UGREEN 2K Webcam
    v4l2-ctl -d /dev/video0 --set-ctrl=brightness=-30
    v4l2-ctl -d /dev/video0 --set-ctrl=contrast=41
    v4l2-ctl -d /dev/video0 --set-ctrl=saturation=80
    v4l2-ctl -d /dev/video0 --set-ctrl white_balance_automatic=0
    v4l2-ctl -d /dev/video0 --set-fmt-video=width=2560,height=1440,pixelformat=MJPG
  '';
in
{
  environment.systemPackages = with pkgs; [
    v4l-utils
    ffmpeg
    mpv
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
}
