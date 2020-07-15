{ ... }: {
  systemd.tmpfiles.rules = [
    "C /root/.docker/config.json 400 root root - /etc/nixos/secrets/docker-config.json"
  ];

  # Enable Local Attestation Service as a systemd service
  virtualisation.oci-containers.containers.localAttestation = {
    image = "sconecuratedimages/helloworld:las";
    ports = [ "18766:18766" ];
    extraOptions = [
      "--device=/dev/isgx"
      # exposes /var/run/aesmd/aesm.socket
      "--volume=/var/run/aesmd:/var/run/aesmd"
    ];
  };

  # Open ports for communicating with CAS
  networking.firewall.allowedTCPPorts = [
    8081
    9081
    18765
  ];
}
