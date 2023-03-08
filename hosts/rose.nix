{
  imports = [
    ../modules/ipmi-supermicro.nix
    ../modules/hardware/supermicro-AS-4124GS.nix
    ../modules/nfs/client.nix

    ../modules/xilinx.nix
    ../modules/xrdp.nix
    ../modules/xrdp-passwords.nix
  ];

  networking.hostName = "rose";

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
  ];
}