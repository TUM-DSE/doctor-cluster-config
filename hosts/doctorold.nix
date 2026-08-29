# Old monitoring VM (vmbhatotia43 / 131.159.102.4). Only forwards HTTP(S) to
# the new VMs until the *.dos.cit.tum.de / *.dse.in.tum.de CNAMEs are moved.
{ config, ... }:
let
  hosts = config.networking.doctorwho.hosts;
in
{
  imports = [
    ../modules/nspawn-container.nix
  ];

  networking.hostName = "doctorold";
  simd.arch = "broadwell";

  services.nginx = {
    enable = true;
    # :80 is only ACME HTTP-01 and redirects; route by Host header
    virtualHosts."_" = {
      default = true;
      locations."/".extraConfig = ''
        proxy_pass http://$backend_http;
        proxy_set_header Host $host;
      '';
    };
    commonHttpConfig = ''
      map $host $backend_http {
        hostnames;
        default ${hosts.doctor.ipv4};
        cache.dos.cit.tum.de ${hosts.nixcache.ipv4};
        niks3.dos.cit.tum.de ${hosts.nixcache.ipv4};
      }
    '';
    streamConfig = ''
      map $ssl_preread_server_name $backend_https {
        hostnames;
        default ${hosts.doctor.ipv4}:443;
        cache.dos.cit.tum.de ${hosts.nixcache.ipv4}:443;
        niks3.dos.cit.tum.de ${hosts.nixcache.ipv4}:443;
      }
      server {
        listen 443;
        listen [::]:443;
        ssl_preread on;
        proxy_pass $backend_https;
      }
    '';
  };

  system.stateVersion = "21.11";
}
