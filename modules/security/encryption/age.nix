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
      weatherAPI.file = ../../../secrets/weatherAPI.age;
    };
  };

  home-manager.users.${username} = {
    imports = [
      agenix.homeManagerModules.default
    ];

    age = {
      identityPaths = [
        "/home/${username}/.ssh/agenix_key"
      ];

      secrets = {
        weatherAPI.file = ../../../secrets/weatherAPI.age;
      };
    };
  };
}
