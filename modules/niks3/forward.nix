# Stopgap: {niks3,cache}.dos.cit.tum.de DNS currently resolves to dosvm5
# (doctor) instead of nixcache. Proxy through until the records are fixed.
{ config, ... }:
let
  hosts = config.networking.doctorwho.hosts;
  forward = {
    enableACME = true;
    forceSSL = true;
    locations."/" = {
      proxyPass = "https://${hosts.nixcache.ipv4}";
      recommendedProxySettings = true;
      extraConfig = ''
        proxy_ssl_server_name on;
        proxy_ssl_name $host;
        client_max_body_size 0;
        proxy_request_buffering off;
        proxy_buffering off;
      '';
    };
  };
in
{
  services.nginx.virtualHosts."niks3.dos.cit.tum.de" = forward;
  services.nginx.virtualHosts."cache.dos.cit.tum.de" = forward;
}
