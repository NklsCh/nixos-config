{
  pkgs,
  zen-browser,
  ...
}:
{
  environment.systemPackages = [
    zen-browser.packages."${pkgs.system}".zen
  ];
}
