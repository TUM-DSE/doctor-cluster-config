{ config, lib, ... }: {
  services.k3s.serverAddr = lib.mkIf (config.services.k3s.role == "agent")
    "https://astrid.dse.in.tum.de:6443";

  sops.secrets.k3s-test-cluster-server-token = {};
  services.k3s.tokenFile = config.sops.secrets.k3s-test-cluster-server-token.path;
}
