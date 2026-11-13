# farm.dos.cit.tum.de: the farm for clients outside the chair network. The
# university firewall only lets 80/443 through to doctor, so nginx terminates
# TLS with a Let's Encrypt certificate and passes gRPC on to the balancer.
# The bearer token travels in a header and reaches the workers unchanged.
{ config, ... }:
let
  farm = import ./settings.nix;
  lb = config.networking.doctorwho.hosts.${farm.lbHost}.ipv4;
in
{
  services.nginx.virtualHosts.${farm.domain} = {
    forceSSL = true;
    enableACME = true;
    http2 = true;
    extraConfig = ''
      # one stream per build of a client
      http2_max_concurrent_streams 1024;
    '';
    locations."/".extraConfig = ''
      grpc_pass grpcs://${lb}:${toString farm.port};
      grpc_ssl_trusted_certificate ${farm.certs}/ca.crt;
      grpc_ssl_verify on;
      grpc_ssl_name ${farm.lbName};
      grpc_ssl_server_name on;
      # a build that prints nothing sends nothing until it is done
      grpc_read_timeout 1d;
      grpc_send_timeout 1d;
      client_body_timeout 1d;
      client_max_body_size 0;
    '';
  };
}
