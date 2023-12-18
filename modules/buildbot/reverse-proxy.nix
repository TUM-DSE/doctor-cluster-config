{
  imports = [ ./hostfile.nix ];
  services.nginx.virtualHosts."buildbot.dse.in.tum.de" = {
    forceSSL = true;
    enableACME = true;

    locations."/".proxyPass = "http://buildbot-master/";
    locations."/sse" = {
      proxyPass = "http://buildbot-master/sse/";
      # proxy buffering will prevent sse to work
      extraConfig = "proxy_buffering off;";
    };
    locations."/ws" = {
      proxyPass = "http://buildbot-master/ws";
      proxyWebsockets = true;
      # raise the proxy timeout for the websocket
      extraConfig = "proxy_read_timeout 6000s;";
    };
  };
}
