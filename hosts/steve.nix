{ pkgs, ... }:
{
  imports = [
    ../modules/hardware/supermicro-322GA-NR.nix
    ../modules/nfs/client.nix
    ../modules/nfs
    ../modules/nvidia
    ../modules/vfio/iommu-intel.nix
    ../modules/ccache.nix
  ];

  disko.rootDisk = "/dev/disk/by-id/nvme-SAMSUNG_MZQL23T8HCLS-00A07_S64HNN0XA09313";

  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
  };

  networking.hostName = "steve";
  virtualisation.libvirtd.enable = true;
  # to do passthrough without having to sudo
  security.pam.loginLimits = [
	{ domain = "@kvm"; type = "soft"; item = "memlock"; value = "unlimited"; }
  	{ domain = "@kvm"; type = "hard"; item = "memlock"; value = "unlimited"; }
  ];
  boot.kernelModules = [ "kvm-intel" ];

  system.stateVersion = "22.11";
}
