{ config, pkgs, ... }:
{
  age.secrets.bw_session = {
    file = ../../../secrets/bw_session.age;
  };
  environment = {
    systemPackages = with pkgs; [
    bitwarden
    bitwarden-cli
    bitwarden-menu
    ];
    sessionVariables = {
      BW_SESSION = "$(cat ${config.age.secrets.bw_session.path})";
    };
  };
}
