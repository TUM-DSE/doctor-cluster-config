{  ... }: {
  services.nginx.virtualHosts."grafana.dos.cit.tum.de" = {
    addSSL = true;
    enableACME = true;
    locations."/" = {
      proxyPass = "http://clara.dos.cit.tum.de";
      proxyWebsockets = true;
      recommendedProxySettings = true;
    };
  };
}
