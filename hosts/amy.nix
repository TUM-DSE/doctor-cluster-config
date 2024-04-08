{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-AS-4124GS.nix
    ../modules/nfs/client.nix

    ../modules/xilinx.nix
    ../modules/xrdp.nix
    ../modules/xrdp-passwords.nix

    ../modules/intel-fpgas.nix
  ];

  networking.hostName = "amy";

  # for some reason the disk naming/usage of /dev/nvme{0,1}n1 is
  # inconsistent on this server compared to others. Lets now be
  # super explicit, in case this is due to inconsistent device
  # naming by kernels. 
  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL21T9HCJR-00A07_S64GNA0T724989";

  simd.arch = "znver3";
  system.stateVersion = "22.11";

  # manually added to load xilinx from
  fileSystems."/share" = {
    device = "nfs:/export/share";
    fsType = "nfs4";
    options = [
      "nofail"
      "ro"
      "timeo=14"
    ];
  };
  users.xrdpUsers = [ 
    "xilinx"
    "atsushi" 
    "chenjiyang"
  ];
}
