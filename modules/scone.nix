{ ... }: {
  environment.etc."sgx-musl.conf".text = ''
    Q 8
    e -1 0 0
    s -1 0 0
    s -1 0 0
    e -1 1 0
    s -1 1 0
    s -1 1 0
    e -1 2 0
    s -1 2 0
    s -1 2 0
    e -1 3 0
    s -1 3 0
    s -1 3 0
    e -1 4 0
    s -1 4 0
    s -1 4 0
    e -1 5 0
    s -1 5 0
    s -1 5 0
    e -1 6 0
    s -1 6 0
    s -1 6 0
    e -1 7 0
    s -1 7 0
    s -1 7 0
  '';

  systemd.tmpfiles.rules = [
    "C /root/.docker/config.json 400 root root - /etc/nixos/secrets/docker-config.json"
  ];

  # Enable Local Attestation Service as a systemd service
  virtualisation.oci-containers.containers.localAttestation = {
    image = "sconecuratedimages/helloworld:las";
    ports = [ "18766:18766" ];
    extraOptions = [
      "--device=/dev/isgx"
    ];
  };

  # Open ports for communicating with CAS
  networking.firewall.allowedTCPPorts = [
    8081
    9081
    18765
  ];
}
