{
  # SEV-SNP host support is upstream since 6.11 and the required config
  # options (AMD_MEM_ENCRYPT, KVM_AMD_SEV, CRYPTO_DEV_CCP*, VFIO_DEVICE_CDEV)
  # are enabled in the stock nixpkgs kernel, so no rebuild is needed.

  boot.kernelParams = [
    "kvm_amd.sev=1"
    "kvm_amd.sev_es=1"
    "kvm_amd.sev_snp=1"
    "sp5100_tco.blacklist=yes"
  ];

  virtualisation.libvirtd.enable = true;
}
