{ config
, lib
, ...
}: {
  imports = [ ./. ];

  sops.secrets.k3s-server-token.sopsFile = ./secrets.yml;
  services.k3s.role = "agent";
  # generated random string
  services.k3s.tokenFile = lib.mkDefault config.sops.secrets.k3s-server-token.path;
  services.k3s.serverAddr = lib.mkDefault "https://astrid.dos.cit.tum.de:6443";
  services.k3s.extraFlags = "--node-ip ${config.networking.doctorwho.currentHost.ipv4} --snapshotter=zfs --container-runtime-endpoint unix:///run/containerd/containerd.sock";
}
