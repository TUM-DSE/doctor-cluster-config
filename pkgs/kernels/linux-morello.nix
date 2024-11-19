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
              CONFIG_CHERI_PURECAP_UABI y
              CONFIG_ARM64_MORELLO y
              CONFIG_ANON_VMA_NAME y
              CONFIG_ACPI y
              CONFIG_ARM64_VA_BITS_48 y
              CONFIG_ARM_MHU y
              CONFIG_PLATFORM_MHU y
              CONFIG_IP_PNP y
              CONFIG_IP_PNP_DHCP y
              CONFIG_ARM_SCMI_PROTOCOL y
              CONFIG_ARM_SCMI_POWER_DOMAIN y
              CONFIG_ARM_SCMI_CPUFREQ y
              CONFIG_SENSORS_ARM_SCMI y
              CONFIG_COMMON_CLK_SCMI y
              CONFIG_CPU_FREQ_GOV_POWERSAVE y
              CONFIG_ARM_SMMU_V3 y
              CONFIG_EXTRA_FIRMWARE ""
              CONFIG_EXTRA_FIRMWARE_DIR ""
              CONFIG_USB_XHCI_PCI y
              CONFIG_USB_XHCI_PCI_RENESAS y
              CONFIG_USB_STORAGE y
              CONFIG_DRM y
              CONFIG_DRM_FBDEV_EMULATION y
              CONFIG_DRM_I2C_NXP_TDA998X y
              CONFIG_DRM_KOMEDA y
              CONFIG_DRM_PANFROST y
              CONFIG_FB_EFI y
              CONFIG_I2C_CADENCE y
              CONFIG_ATA y
              CONFIG_SATA_AHCI y
              CONFIG_BLK_DEV_NVME y
              CONFIG_ETHERNET y
              CONFIG_R8169 y
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
