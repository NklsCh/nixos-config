{ hostName, ... }:
{
  imports = [
    ./${hostName}
    ./internationalisation
  ];
}