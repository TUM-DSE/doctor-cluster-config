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
          "LLVM=${llvmMorello}/bin/"
          "LLVM_IAS=1"
        ];

        kernelPatches = [
          {
            name = "enable morello";
            patch = null;
            extraConfig = ''
              CHERI_PURECAP_UABI y
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
              EXTRA_FIRMWARE ""
              EXTRA_FIRMWARE_DIR ""
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
              R8169 y
              ZFS y
            '';
          }
        ] ++ extraPatches;
        extraMeta.branch = version;
        ignoreConfigErrors = true;
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
    modDirVersion = "6.7.0-morello1.8.1";
    extraPatches = [
      {
        name = "set version";
        patch = ./morello-version.patch;
        extraConfig = "";
      }
    ];
  };
in
# change here to change kernel
buildMorelloKernel morello_1_8_1
