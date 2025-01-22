{ ... }:
{
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    flake = "/etc/nixos";
    flags = [
      "--update-input"
      "nixpkgs"
      "--commit-lock-file"
    ];
  };
}
