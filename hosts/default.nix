  { hostName, ... }:
{
  imports = [
    ./${hostName}
    ./internationalisation
  ];
}
