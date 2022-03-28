{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./users.nix
    ./network.nix
    ./storage.nix
  ];

  # Students are not careful exposing ports with containers
  networking.firewall.enable = lib.mkForce true;

  # isolates better than docker
  virtualisation.podman.enable = true;

  # needed for the container task
  environment.systemPackages = [
    pkgs.docker-compose
  ];

  # Do not do collide with the TUM vpn
  environment.etc."docker/daemon.json".text = builtins.toJSON {
    default-address-pools = [
      {
        base = "192.168.0.0/16";
        size = 24;
      }
    ];
  };
}
