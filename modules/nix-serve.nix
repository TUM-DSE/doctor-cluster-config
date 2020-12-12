{ config, lib, ... }: {
  systemd.tmpfiles.rules = [
    "C /run/cache-priv-key.pem 400 nix-serve root - /etc/nixos/secrets/cache-priv-key.pem"
  ];
  services.nix-serve = {
    enable = true;
    secretKeyFile = "/run/cache-priv-key.pem";
  };
  networking.firewall.allowedTCPPorts = [ 5000 ];

  nix.binaryCaches = let
    filterHosts = name: host: name != config.networking.hostName && host.serveBinaryCache;
    filteredHosts = lib.filterAttrs filterHosts config.networking.doctorwho.hosts;
  in lib.mapAttrsToList (name: host: "http://${name}:5000") filteredHosts;

  nix.binaryCachePublicKeys = [
    "doctor-who-cache.thalheim.io:2kOtVHXVpm7MtlWA7o4VwV35lgAJ7oF9b6xJE23Kfd4="
  ];
}
