{ hostName, username, ... }:
{
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
    inherit hostName;
    firewall = {
      allowedTCPPorts = [ 53317 ];
      allowedUDPPorts = [ 53317 ];
    };
  };

  users.users.${username} = {
    extraGroups = [ "networkmanager" ];
  };

  programs.traceroute.enable = true;
}
