# Login host for compiler-hw-lab students (https://gitlab.lrz.de/compiler-hw-lab)
# without an x86_64 machine. Import it instead of ../nfs/client.nix: without
# the NFS mounts, /home is local, and students can't read anyone else's home.
{ lib, ... }:
{
  users.motd = ''

    ======================================================================
     This machine is shared with students of the compiler-hw-lab course.

     - /home is local to this machine and NOT the NFS home you know from
       the other cluster machines. Nothing here is backed up.
     - Do not store anything important or secret here.
     - Run containers with `podman` (or `docker`, an alias for it).
       Containers run rootless as your own user.
    ======================================================================

  '';

  # prevent users from opening ports
  networking.firewall = {
    # ../network.nix disables it with mkForce
    enable = lib.mkOverride 40 true;
    trustedInterfaces = [
      "tinc.retiolum"
      "virbr0"
    ];
    allowedTCPPorts = [ 655 ];
    allowedUDPPorts = [ 655 ];
  };

  # Keep students out of each other's /scratch/<user>.
  scratchSpace.mode = "0700";

  # run rootless podman instead of docker
  virtualisation.docker.enable = lib.mkForce false;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  virtualisation.containers.storage.settings.storage = {
    driver = "overlay";
    graphroot = "/var/lib/containers/storage";
    runroot = "/run/containers/storage";
  };
}
