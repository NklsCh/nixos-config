let
  userPublicKey = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMLM5QhQNZGcHimWcCqS/I/l1KY1xBKAajPhY4xzd/v0 v3rm1n@Desktop"
  ];
in
{
  "weatherAPI.age".publicKeys = userPublicKey;
}
