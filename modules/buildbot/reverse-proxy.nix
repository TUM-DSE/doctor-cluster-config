{
  imports = [ ./hostfile.nix ];
  services.nginx.virtualHosts."buildbot.dse.in.tum.de" = {
    forceSSL = true;
    enableACME = true;

    locations."/" = {
      proxyPass = "http://buildbot-master:8010";
      proxyWebsockets = true;
      extraConfig = ''
        # Webhook deliveries can exceed nginx's 1m default
        # (GitHub caps payloads at 25 MB).
        client_max_body_size 25m;
        proxy_connect_timeout 120s;
        proxy_send_timeout 120s;
        # Long timeout keeps SSE log streams and websockets alive.
        proxy_read_timeout 3600s;
        # Buffering would stall SSE.
        proxy_buffering off;
      '';
    };
  };
}
