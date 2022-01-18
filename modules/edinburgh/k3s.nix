{ config, lib, ... }: {
  services.k3s.serverAddr = lib.mkIf (config.services.k3s.role == "agent")
    "https://rose.thalheim.io:6443";

  sops.secrets.edinburgh-k3s-server-token = {};
  services.k3s.tokenFile = config.sops.secrets.edinburgh-k3s-server-token.path;
}
