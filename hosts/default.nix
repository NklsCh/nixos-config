{ hostName, ... }:
{
  imports = [
    ./${hostName}
  ];
}
