{
  imports = [
    ../modules/hardware/poweredge7625.nix
    ../modules/nfs/client.nix
    ../modules/amd_sev_snp.nix
    ../modules/dpdk.nix
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNS0W800676";

  networking.hostName = "vislor";
  # not in nixpkgs yet
  # simd.arch = "zenver4";

  system.stateVersion = "23.05";

  networking.doctor-bridge.enable = true;

  boot.kernelParams = [
    "nvme.poll_queues=4"
    "nvme_core.multipath=N"
  ];
}
