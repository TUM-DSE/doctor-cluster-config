{
  buildLinux,
  fetchFromGitLab,
  callPackage,
  stdenv,
  overrideCC,
  ccacheStdenv,
  llvmPackages_16,
  ...
}@args:
let
  llvmMorello = callPackage ../compilers/llvm-morello.nix { };
  llvmPackages = llvmMorello;

  buildMorelloKernel =
    {
      domain,
      owner,
      repo,
      rev,
      sha256,
      version,
      modDirVersion,
      extraPatches ? [ ],
    }:
    buildLinux (
      args
      // rec {
        inherit version modDirVersion;

        stdenv = llvmMorello.stdenv;

        src = fetchFromGitLab {
          inherit
            domain
            owner
            repo
            rev
            sha256
            ;
        };

        extraMakeFlags = [
          "LLVM=1"
          "LLVM_IAS=1"
          "CC=${llvmMorello}/bin/clang"
          "LD=${llvmMorello}/bin/ld.lld"
          "HOSTLD=${llvmMorello}/bin/ld.lld"
          "AR=${llvmMorello}/bin/llvm-ar"
          "HOSTAR=${llvmMorello}/bin/llvm-ar"
          "NM=${llvmMorello}/bin/llvm-nm"
          "STRIP=${llvmMorello}/bin/llvm-strip"
          "OBJCOPY=${llvmMorello}/bin/llvm-objcopy"
          "OBJDUMP=${llvmMorello}/bin/llvm-objdump"
          "READELF=${llvmMorello}/bin/llvm-readelf"
          "HOSTCC=${llvmMorello}/bin/clang"
          "HOSTCXX=${llvmMorello}/bin/clang++"
          "V=1"
        ];

        kernelPatches = [
          {
            name = "enable morello";
            #ARM64_MORELLO y
            patch = null;
            extraConfig = ''
              CONFIG_ARM64_MORELLO y
              ARM64_MORELLO y
              ANON_VMA_NAME y
              ACPI y
              ARM64_VA_BITS_48 y
              ARM_MHU y
              PLATFORM_MHU y
              IP_PNP y
              IP_PNP_DHCP y
              ARM_SCMI_PROTOCOL y
              ARM_SCMI_POWER_DOMAIN y
              ARM_SCMI_CPUFREQ y
              SENSORS_ARM_SCMI y
              COMMON_CLK_SCMI y
              CPU_FREQ_GOV_POWERSAVE y
              ARM_SMMU_V3 y
              USB_XHCI_PCI y
              USB_XHCI_PCI_RENESAS y
              USB_STORAGE y
              DRM y
              DRM_FBDEV_EMULATION y
              DRM_I2C_NXP_TDA998X y
              DRM_KOMEDA y
              DRM_PANFROST y
              FB_EFI y
              I2C_CADENCE y
              ATA y
              SATA_AHCI y
              BLK_DEV_NVME y
              ETHERNET y

              TCG_TPM m
              TCG_TIS m
              TCG_CRB m
              SATA_NV m
              SATA_VIA m
              SATA_SIS m
              SATA_ULI m
              SATA_MV m
              ATA_GENERIC m
              ATA_PIIX m
              PATA_MARVELL m

              BLK_DEV_SR m
              USB_UHCI_HCD m
              HID_LENOVO m
              HID_ROCCAT m
              HID_LOGITECH_HIDPP m
              HID_LOGITECH_DJ m
              HID_CORSAIR m

              R8169 m

              MODULES_ALL y
              MODULES y

              NF_TABLES m
              NF_TABLES_INET y
              NF_TABLES_IPV4 y
              NF_TABLES_IPV6 y
              NF_TABLES_ARP y
              NF_TABLES_BRIDGE m
              NFT_CHAIN_ROUTE_IPV4 y
              NFT_CHAIN_ROUTE_IPV6 y
              NFT_REJECT m
              NFT_MASQ m
              NFT_LOG m
              NFT_LIMIT m
              NFT_NAT m
            '';
          }
        ] ++ extraPatches;
        extraMeta.branch = version;
#        ignoreConfigErrors = true;
        autoModules = false;
      }
      // (args.argsOverride or { })
    );

  # https://git.morello-project.org/morello/kernel/linux
  # 1.8.1
  morello_1_8_1 = {
    domain = "git.morello-project.org";
    owner = "morello/kernel";
    repo = "linux";
    rev = "96c45a786534d894387e17ed60e4d31d33911567";
    sha256 = "sha256-HETq4ntekppJ6T6rGDzj9U0TlDdoy1oajIWfeZScoY0=";
    version = "6.7";
    modDirVersion = "6.7.0";
    extraPatches = [
    ];
  };
in
# change here to change kernel
buildMorelloKernel morello_1_8_1
