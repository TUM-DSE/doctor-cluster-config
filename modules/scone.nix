{ lib, ... }: {
  sops.secrets.docker-config.path = "/root/.docker/config.json";

  # Open ports for communicating with CAS
  networking.firewall.allowedTCPPorts = [
    8081
    9081
    18765
  ];
}
