{
  imports = [
    ../modules/hardware/supermicro-ARS-211M-NR.nix
    ../modules/nfs/client.nix
    ../modules/disko-zfs.nix
    ../modules/buildbot/builder.nix
  ];

  networking.hostName = "eliza";

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNN0XA20382";

  system.stateVersion = "24.11";

  simd.arch = "armv8.6-a";

  security.pam.loginLimits = [
    {
      domain = "*";
      type = "soft";
      item = "nofile";
      value = "8192";
    }
  ];
  systemd.user.extraConfig = ''
    DefaultLimitNOFILE=8192
  '';
}
