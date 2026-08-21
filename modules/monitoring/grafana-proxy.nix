{ config, ... }: {
  sops.secrets.monitoring-basic-auth = {
    sopsFile = ./secrets.yml;
    owner = "nginx";
  };

  services.nginx.virtualHosts."grafana.dos.cit.tum.de" = {
    addSSL = true;
    enableACME = true;
    basicAuthFile = config.sops.secrets.monitoring-basic-auth.path;
    locations."/" = {
      proxyPass = "http://clara.dos.cit.tum.de";
      proxyWebsockets = true;
      recommendedProxySettings = true;
      # don't let Grafana interpret the basic-auth credentials as a login
      extraConfig = ''
        proxy_set_header Authorization "";
      '';
    };
  };
}
