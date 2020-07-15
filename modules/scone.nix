{ ... }: {
  environment.etc."sgx-musl.conf".text = ''
    Q 2
    e 0 0 0
    s 1 0 0
    e 2 1 0
    s 3 1 0
    s 4 0 0
    s 5 1 0
    s 6 0 0
    s 7 1 0
    s 8 0 0
    s 9 1 0
    s 10 0 0
    s 11 1 0
    s 12 0 0
    s 13 1 0
    s 14 0 0
    s 15 1 0
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
