{ config, lib, ... }:
{
  services.k3s.serverAddr = lib.mkIf (
    config.services.k3s.role == "agent"
  ) "https://astrid.dos.cit.tum.de:6443";

  sops.secrets.k3s-test-cluster-server-token.sopsFile = ./secrets.yml;
  services.k3s.tokenFile = config.sops.secrets.k3s-test-cluster-server-token.path;
}
