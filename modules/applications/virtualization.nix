{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    qemu
    quickemu
  ];
  programs.virt-manager.enable = true;
  users.users.${username}.extraGroups = [ "libvirtd" ];
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
}
