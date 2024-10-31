{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    zed-editor
    nodejs_latest
  ];
}
