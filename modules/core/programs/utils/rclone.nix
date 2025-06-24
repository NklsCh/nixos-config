{
  lib,
  pkgs,
  username,
  ...
}:
{
  environment.systemPackages = with pkgs; [ rclone ];

  home-manager.users.${username} = {
    systemd.user.services = {
      gdrive =
        let
          mountdir = "/home/${username}/\"Google Drive\"";
        in
        {
          Unit = {
            Description = "Mount Google Drive Drive";
            After = [ "network-online.target" ];
          };

          Service = {
            Type = "notify";
            Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
            ExecStartPre = "${lib.getExe' pkgs.uutils-coreutils-noprefix "mkdir"} -p ${mountdir}";

            ExecStart = ''
              ${lib.getExe pkgs.rclone} mount gdrive: ${mountdir} \
                  --config=/run/agenix/rclone_conf \
                  --vfs-cache-mode writes \
                  --vfs-cache-max-size 100M
            '';

            ExecStop = "${lib.getExe' pkgs.fuse "fusermount"} -u ${mountdir}";
            Restart = "always";
            RestartSec = 5;
          };

          Install.WantedBy = [ "default.target" ];
        };
      icloud =
        let
          mountdir = "/home/${username}/icloud";
        in
        {
          Unit = {
            Description = "Mount iCloud Drive";
            After = [ "network-online.target" ];
          };

          Service = {
            Type = "notify";
            Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
            ExecStartPre = "${lib.getExe' pkgs.uutils-coreutils-noprefix "mkdir"} -p ${mountdir}";

            ExecStart = ''
              ${lib.getExe pkgs.rclone} mount icloud: ${mountdir} \
                  --config=/run/agenix/rclone_conf \
                  --dir-cache-time 48h \
                  --vfs-cache-mode full \
                  --vfs-cache-max-age 48h \
                  --vfs-read-chunk-size 10M \
                  --vfs-read-chunk-size-limit 512M \
                  --no-modtime \
                  --buffer-size 512M
            '';

            ExecStop = "${lib.getExe' pkgs.fuse "fusermount"} -u ${mountdir}";
            Restart = "always";
            RestartSec = 5;
          };

          Install.WantedBy = [ "default.target" ];
        };
    };
  };
  environment.etc."fuse.conf".text = ''
    user_allow_other
  '';
}
