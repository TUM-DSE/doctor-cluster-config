{ pkgs, ... }:
let
  directory = "/var/lib/stable-diffusion";
  vhost = {
    locations."/" = {
      proxyPass = "http://localhost:7860";
      proxyWebsockets = true;
    };
    locations."/outputs".return = "301 /output";
    locations."/output" = {
      root = directory;
      extraConfig = ''
        dav_ext_methods PROPFIND OPTIONS;
        dav_access all:r;

        autoindex on;
        autoindex_exact_size off;
      '';
    };
  };
in
{
  networking.firewall.allowedTCPPorts = [ 80 ];

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts."stable-diffusion.thalheim.io" = vhost;
    virtualHosts."stable-confusion.thalheim.io" = vhost;
    virtualHosts."stable-confusion.r" = vhost;
    virtualHosts."jack.r".locations."/".proxyPass = "http://localhost:59125";
  };

  systemd.services.stable-diffusion-ui-output-generator = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
    path = [
      pkgs.jq
      pkgs.coreutils
      pkgs.mustache-go
    ];
    script =
      let
        template = pkgs.writeText "template" ''
          <html>
          <body>
          {{#entries}}
            <a href="/output/{{path}}"><img src="/output/{{path}}"></img></a>
          {{/entries}}
          </body></html>
        '';
      in
      ''
        find ${directory}/output -type f \( -iname \*.jpg -o -iname \*.png \) \
            -printf '{"time":"%T@","path":"%P"}\n' | \
            jq --slurp 'sort_by(.time) | reverse' | jq '{entries:.[:30]}' > /run/stable-diffusion/last.json
        mustache /run/stable-diffusion/last.json ${template} > ${directory}/output/latest-gallery.html
      '';
    serviceConfig = {
      RuntimeDirectory = "stable-diffusion";
      Restart = "always";
      RestartSec = 60;
    };
  };

  systemd.services.stable-diffusion-ui = {
    enable = true;
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      WorkingDirectory = directory;
      ExecStart = "${pkgs.docker}/bin/docker compose --profile auto up --build --remove-orphans";
    };
  };
}
