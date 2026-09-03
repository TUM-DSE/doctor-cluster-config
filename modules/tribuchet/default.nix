# tribuchet build worker for the hub on eve
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.flakelet.nixosModules.flakelet
    inputs.flakelet-relay.nixosModules.agent
    ../flakelet-deploy.nix
  ];

  # Agent identity for the relays on eve/eva: ACME cert for <host>.r
  # from step-ca (ca.r) over retiolum, http-01 answered by lego itself.
  security.acme = {
    acceptTerms = true;
    defaults.email = lib.mkDefault "joerg.letsencrypt@thalheim.io";
    certs."${config.networking.hostName}.r" = {
      server = config.retiolum.ca.acmeURL;
      listenHTTP = ":80";
      reloadServices = [ "flakelet-agent.service" ];
    };
  };
  networking.firewall.interfaces."tinc.retiolum".allowedTCPPorts = [ 80 ];

  services.flakelet-agent = {
    enable = true;
    relaySrv = "thalheim.io";
    certFile = "/var/lib/acme/${config.networking.hostName}.r/fullchain.pem";
    keyFile = "/var/lib/acme/${config.networking.hostName}.r/key.pem";
    flakelets = [ "tribuchet-worker" ];
  };

  # eve's step-ca ssh user CA (dotfiles vars step-ssh-user-ca)
  services.flakeletDeploy = {
    caPublicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO8BeUknHHUL6H1AGJjubrNS2Q56a/5/chabONTMSJ4l step-ca ssh user ca";
    services.tribuchet-worker.principals = [ "repo:github:Mic92/tribuchet:ref:refs/heads/main" ];
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
        };
      };
    };
  };
}
