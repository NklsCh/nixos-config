let
  v3rm1n = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMLM5QhQNZGcHimWcCqS/I/l1KY1xBKAajPhY4xzd/v0 v3rm1n@Desktop";
  users = [ v3rm1n ];
in
{
  "rclone_conf.age".publicKeys = users;
  "weatherAPI.age".publicKeys = users;
}
