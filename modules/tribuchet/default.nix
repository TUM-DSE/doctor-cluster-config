# tribuchet build worker for the hub on eve. Serves this host's native
# system; max-jobs defaults to the host's core count in tribuchet.
{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.tribuchet.nixosModules.default ];

  # worker.key is signed by the CA generated on eve (clan vars generator
  # "tribuchet" in the dotfiles repo); ca.crt and worker.crt are public
  # and committed next to this module. The default sopsFile is the
  # importing host's hosts/<host>.yml.
  sops.secrets."tribuchet-worker-key" = { };

  services.tribuchet-worker = {
    enable = true;
    settings = {
      hub = "https://eve.thalheim.io:7437";
      systems = [ pkgs.stdenv.hostPlatform.system ];
      max-log-size = 67108864;
      ca-cert = ./ca.crt;
      cert = ./worker.crt;
      key = config.sops.secrets."tribuchet-worker-key".path;
    };
  };
}
