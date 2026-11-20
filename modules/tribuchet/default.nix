# tribuchet build worker for the hub on eve
{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ../flakelet.nix
  ];

  # Agent identity for the relays on eve/eva: ACME cert for <host>.r
  # from step-ca (ca.r) over retiolum, http-01 answered by lego itself.
  security.acme = {
    acceptTerms = true;
    defaults.email = lib.mkDefault "joerg.letsencrypt@thalheim.io";
    certs."${config.networking.hostName}.r" = {
      server = config.retiolum.ca.acmeURL;
      listenHTTP = lib.mkIf (!config.services.nginx.enable) ":80";
      reloadServices = [ "flakelet-agent.service" ];
    };
  };
  # Where nginx already owns port 80 (graham), it answers the challenge.
  services.nginx.virtualHosts."${config.networking.hostName}.r" = lib.mkIf config.services.nginx.enable {
    enableACME = true;
  };
  networking.firewall.interfaces."tinc.retiolum".allowedTCPPorts = [ 80 ];

  services.flakelets.services.flakelet-agent = {
    flake = "github:Mic92/flakelet-relay";
    output = "flakelets.agent";
    settings = {
      certFile = "/var/lib/acme/${config.networking.hostName}.r/fullchain.pem";
      keyFile = "/var/lib/acme/${config.networking.hostName}.r/key.pem";
      settings = {
        relaySrv = "thalheim.io";
      };
    };
  };

  # signed by the CA from eve's clan vars generator "tribuchet"
  sops.secrets."tribuchet-worker-key" = { };

  # the worker imports build inputs through the nix-daemon unsigned
  nix.settings.trusted-users = [ "tribuchet" ];

  services.flakelets = {
    enable = true;
    services.tribuchet-worker = {
      flake = "github:Mic92/tribuchet";
      output = "flakelets.worker";
      autoUpdate.enable = true;
      settings = {
        keyFile = config.sops.secrets."tribuchet-worker-key".path;
        worker = {
          hub = "https://eve.thalheim.io:7437";
          systems = [ pkgs.stdenv.hostPlatform.system ];
          max-log-size = 67108864;
          ca-cert = "${./ca.crt}";
          cert = "${./worker.crt}";
          # Keep untrusted FODs off internal/TUM networks.
          # Only allow the ports nixpkgs fetchers use.
          # DNS works regardless (pasta), no ftp (passive ports; tarballs.nixos.org fallback).
          # First match wins.
          fod-network = {
            default = "deny";
            rules = [
              {
                action = "deny";
                dst = "private"; # incl. retiolum ULA
              }
              {
                action = "deny";
                dst = "131.159.0.0/16"; # TUM
              }
              {
                action = "deny";
                dst = "2a09:80c0::/29"; # TUM
              }
              {
                action = "allow";
                proto = "tcp";
                dst = "any";
                ports = [
                  "80" # http
                  "443" # https
                  "22" # git+ssh, fetchsvnssh, anoncvs
                  "9418" # git://
                  "3690" # svn://
                  "873" # rsync
                ];
              }
              {
                action = "allow";
                proto = "udp";
                dst = "any";
                ports = [ "443" ]; # http3
              }
            ];
          };
        };
      };
    };
  };
}
