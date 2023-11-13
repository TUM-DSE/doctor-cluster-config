{ ...
}: {
  imports = [ ./. ];
  sops.secrets.k3s-server-token.sopsFile = ./secrets.yml;
  networking.firewall.allowedTCPPorts = [ 6443 ];
  services.k3s.extraFlags = "--disable traefik --snapshotter=zfs --container-runtime-endpoint unix:///run/containerd/containerd.sock --flannel-backend=host-gw";
}
