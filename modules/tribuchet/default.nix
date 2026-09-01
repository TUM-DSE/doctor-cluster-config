# tribuchet build worker for the hub on eve
{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.flakelet.nixosModules.flakelet
    ../flakelet-deploy.nix
  ];

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
