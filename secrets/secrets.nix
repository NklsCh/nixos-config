let
  v3rm1n = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMLM5QhQNZGcHimWcCqS/I/l1KY1xBKAajPhY4xzd/v0 v3rm1n@Desktop";
  users = [ v3rm1n ];

  desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFQic30FdFNauk9O0dSFYkwSw+oKCkDo+oJqEua8K32n root@Desktop";
  systems = [ desktop ];
in
{
  "weatherAPI.age".publicKeys = users ++ systems;
  "rclone_conf.age".publicKeys = users ++ systems;
}
