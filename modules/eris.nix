{ config, lib, pkgs, ... }:
{
  sops.secrets.cache-priv-key-pem.owner = "eris";
  systemd.services.eris-git.serviceConfig = {
    BindReadOnlyPaths = lib.mkForce [
      "/etc/eris"
      "/etc/nixos/secrets"
    ];
    User = "eris";
  };
  services.eris-git.enable = true;
  services.eris-git.configFile = toString (pkgs.writeText "eris.conf" ''
    {
      signing => {
        host    => 'doctor-who-cache.thalheim.io',
        private => '${config.sops.secrets.cache-priv-key-pem.path}',
      },
      listen => [
        'http://[::]:5001',
      ],
    }
  '');
  networking.firewall.allowedTCPPorts = [ 5001 ];
}
