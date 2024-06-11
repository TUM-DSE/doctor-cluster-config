{ ...
}: {
  imports = [ ./. ];
  sops.secrets.k3s-server-token.sopsFile = ./secrets.yml;
  networking.firewall.allowedTCPPorts = [ 6443 ];
  services.k3s.extraFlags = "--disable traefik --snapshotter=zfs --container-runtime-endpoint unix:///run/containerd/containerd.sock --flannel-backend=host-gw";

  virtualisation.oci-containers.containers.registry-proxy = {
    image = "registry";
    environment.REGISTRY_PROXY_REMOTEURL = "https://registry-1.docker.io";
    ports = [ "80:5000" ]; # use port 80, because this is what we whitelist in the firewall of the runner
  };
}
