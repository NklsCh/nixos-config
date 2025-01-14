let
  choinowski = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKRcnvF2EYThdhGp45gfbOck/ZXDZR5CrBiMm0eIx3Vl choinowski@Desktop";
in
{
  "bw_session.age".publicKeys = [ choinowski ];
}
