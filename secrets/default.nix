{
  pkgs,
  username,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    sops
  ];

  sops = {
    #defaultSopsFile = ./weatherAPI.yaml;

    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";

    secrets = {
      "weatherAPI/key" = {
        sopsFile = ./weatherAPI.yaml;
      };
    };
  };
}
