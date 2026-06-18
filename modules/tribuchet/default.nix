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
  # and committed next to this module.
  # default sopsFile is hosts/eliza.yml
  sops.secrets."tribuchet-worker-key" = { };

  services.tribuchet-worker = {
    enable = true;
    settings = {
      hub = "https://eve.thalheim.io:7437";
      # eliza is aarch64; it builds aarch64-linux natively for the hub.
      systems = [ "aarch64-linux" ];
      max-jobs = 8;
      max-log-size = 67108864;
      ca-cert = ./ca.crt;
      cert = ./worker.crt;
      key = config.sops.secrets."tribuchet-worker-key".path;
    };
  };
}
