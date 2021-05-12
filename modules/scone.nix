{ lib, ... }: {
  systemd.tmpfiles.rules = [
    "C /root/.docker/config.json 400 root root - /etc/nixos/secrets/docker-config.json"
  ];

  # Open ports for communicating with CAS
  networking.firewall.allowedTCPPorts = [
    8081
    9081
    18765
  ];
}
