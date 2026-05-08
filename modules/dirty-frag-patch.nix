{ lib, ... }:
{
  boot.extraModprobeConfig = ''
    install esp4 /bin/false
    install esp6 /bin/false
    install rxrpc /bin/false
  '';
  boot.blacklistedKernelModules = [
    "esp4"
    "esp6"
    "rxrpc"
  ];
}
