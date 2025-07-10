{
  agenix,
  system,
  username,
  ...
}:
{
  environment.systemPackages = [
    agenix.packages."${system}".default
  ];

  age = {
    identityPaths = [
      "/home/${username}/.ssh/agenix_key"
    ];
    secrets = {
      weatherAPI = {
        file = ../../../secrets/weatherAPI.age;
        owner = username;
      };
      rclone_conf = {
        file = ../../../secrets/rclone_conf.age;
        owner = username;
      };
    };
  };
}
