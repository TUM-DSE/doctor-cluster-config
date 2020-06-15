{ config, lib, ... }: {
  services.nix-serve = {
    enable = true;
    secretKeyFile = config.krops.secrets."cache-priv-key.pem".path;
  };
  networking.firewall.allowedTCPPorts = [ 5000 ];

  nix.binaryCaches = let
    filterHosts = name: host: name != config.networking.hostName && host.serveBinaryCache;
    filteredHosts = lib.filterAttrs filterHosts config.networking.doctorwho.hosts;
  in lib.mapAttrsToList (name: host: "http://${name}:5000") filteredHosts;

  systemd.services.nix-serve.serviceConfig = {
    SupplementaryGroups = [ "keys" ];
  };

  krops.secrets."cache-priv-key.pem".owner = "nix-serve";

  nix.binaryCachePublicKeys = [
    "doctor-who-cache.thalheim.io:2kOtVHXVpm7MtlWA7o4VwV35lgAJ7oF9b6xJE23Kfd4="
  ];
}
