{ config, lib, ... }: {
  services.nix-serve = {
    enable = true;
    secretKeyFile = "/etc/nixos/secrets/cache-priv-key.pem";
  };
  networking.firewall.allowedTCPPorts = [ 5000 ];

  nix.binaryCaches = let
    filterHosts = name: host: name != config.networking.hostName && host.serveBinaryCache;
    filteredHosts = lib.filterAttrs filterHosts config.networking.doctorwho.hosts;
  in lib.mapAttrsToList (name: host: "https://${name}:5000") filteredHosts;

  nix.binaryCachePublicKeys = [
    "doctor-who-cache.thalheim.io:2kOtVHXVpm7MtlWA7o4VwV35lgAJ7oF9b6xJE23Kfd4="
  ];
}
