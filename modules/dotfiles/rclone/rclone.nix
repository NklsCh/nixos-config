{ pkgs, pkgs-unstable, ... }:
{
  systemd.services.rclone-gdrive = {
    description = "rclone: Mount gdrive";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    serviceConfig = {
      Type = "simple";
      User = "choinowski";
      Group = "users";

      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p /home/choinowski/gdrive";

      Environment = "PATH=run/wrappers/bin:/bin:/usr/bin:${pkgs.coreutils}/bin:${pkgs.fuse}/bin";
      ExecStart = "${pkgs.rclone}/bin/rclone mount gdrive: /home/choinowski/gdrive";

      ExecStop = "/run/wrappers/bin/fusermount3 -u /home/choinowski/gdrive";
    };
    wantedBy = [ "multi-user.target" ];
  };
  environment.etc."fuse.conf".text = ''
    user_allow_other
  '';
}
