
{
  imports = [
    ../modules/hardware/poweredge7625.nix
    ../modules/bonding.nix
    ../modules/nfs/client.nix
    ../modules/amd_sev_snp.nix
    ../modules/dpdk.nix
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-Samsung_SSD_970_EVO_Plus_1TB_S4EWNX0R410276D";
  
  networking.doctowho.bonding.macs = [
    "94:6d:ae:da:eb:42"
    "94:6d:ae:da:eb:43"
  ];

  networking.hostName = "vislor";
  # not in nixpkgs yet
  # simd.arch = "zenver4";

  system.stateVersion = "23.05";
}
