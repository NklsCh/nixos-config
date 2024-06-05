{ pkgs, username, ... }:

{
  environment.systemPackages = with pkgs; [ rclone ];

  systemd.services.rclone-gdrive = {
    description = "rclone: Mount Google Drive to ~/gdrive";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];

    serviceConfig = {
      Type = "simple";
      User = "${username}";
      Group = "users";
      # Ensure the directory exists before trying to mount
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p /home/${username}/gdrive";
      # Use the full path for fusermount3
      Environment = "PATH=/run/wrappers/bin:/bin:/usr/bin:${pkgs.coreutils}/bin:${pkgs.fuse}/bin";
      ExecStart = "${pkgs.rclone}/bin/rclone mount gdrive: /home/${username}/gdrive --config /home/${username}/.config/rclone/rclone.conf --vfs-cache-mode writes --vfs-cache-max-size 100M --log-level INFO --log-file /tmp/rclone-gdrive.log";
      # Use the full path for fusermount3
      ExecStop = "/run/wrappers/bin/fusermount3 -u /home/${username}/gdrive";
    };

    wantedBy = [ "multi-user.target" ];
  };

  environment.etc."fuse.conf".text = ''
    user_allow_other
  '';
}
