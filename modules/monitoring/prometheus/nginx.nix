let
  proxy = upstream: ''
    proxy_pass       http://@${upstream}/;
    proxy_set_header Host              $host;
    proxy_set_header X-Real-IP         $remote_addr;
    proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Host   $host:443;
    proxy_set_header X-Forwarded-Server $host;
    proxy_set_header X-Forwarded-Port 443;
    proxy_set_header X-Forwarded-Proto $scheme;
  '';
in
{
  security.acme.defaults.email = "joerg.letsencrypt@thalheim.io";
  security.acme.acceptTerms = true;

  services.nginx = {
    commonHttpConfig = ''
      add_header Strict-Transport-Security 'max-age=31536000; includeSubDomains; preload' always;
    '';

    upstreams = {
      "@prometheus".extraConfig = "server localhost:9090;";
      "@alertmanager".extraConfig = "server localhost:9093;";
    };

    virtualHosts."prometheus.dos.cit.tum.de" = {
      forceSSL = true;
      enableACME = true;
      locations."/".extraConfig = proxy "prometheus";
    };

    virtualHosts."alertmanager.dos.cit.tum.de" = {
      forceSSL = true;
      enableACME = true;
      locations."/".extraConfig = proxy "alertmanager";
    };
  };
}
