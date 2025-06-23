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
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    secrets = {
      "weatherAPI/key" = {
        sopsFile = ./weatherAPI.yaml;
      };
      "rclone_conf" = {
        owner = username;
        sopsFile = ./rclone.yaml;
      };
    };
  };
}
