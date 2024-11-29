{
  buildLinux,
  fetchFromGitLab,
  clang-morello,
  clang-morello-unwrapped,
  bintools-morello,
  runCommand,
  fetchurl,
  lib,
  openssl,
  elfutils,
  zlib,
  ...
}@args:
let

  rpath = runCommand "rpath" { } ''
    mkdir $out
    ln -s ${lib.getLib openssl}/lib/* $out
    ln -s ${lib.getLib elfutils}/lib/* $out
    ln -s ${lib.getLib zlib}/lib/* $out
  '';

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
          "CC=${clang-morello-unwrapped}/bin/clang"
          "LD=${clang-morello-unwrapped}/bin/ld.lld"
          "AR=${clang-morello-unwrapped}/bin/llvm-ar"
          "HOSTAR=${clang-morello-unwrapped}/bin/llvm-ar"
          "NM=${clang-morello-unwrapped}/bin/llvm-nm"
          "STRIP=${clang-morello-unwrapped}/bin/llvm-strip"
          "OBJCOPY=${clang-morello-unwrapped}/bin/llvm-objcopy"
          "OBJDUMP=${clang-morello-unwrapped}/bin/llvm-objdump"
          "READELF=${clang-morello-unwrapped}/bin/llvm-readelf"
          "HOSTLD=${bintools-morello}/bin/ld.lld"
          "HOSTCC=${clang-morello}/bin/clang"
          "HOSTCXX=${clang-morello}/bin/clang++"
          # openssl is not added to rpath of ./certs/extract-cert
          "HOSTLDFLAGS=-Wl,--rpath=${rpath}"
        ];

        firmwareSource = fetchurl {
          url = "https://raw.githubusercontent.com/TI-OpenLink/firmwares/refs/heads/master/rtl_nic/rtl8168g-2.fw";
          hash = "sha256-+HjscZ944LEEvHM2KphiYRhYvsiT9YobOyiaClfXHSU=";
        };

        extraFetch = runCommand "prepare-firmware" { } ''
          mkdir -p firmware
          cp ${firmwareSource} firmware/
          chmod -R a+rX firmware
          mkdir -p $out
          cp -r firmware $out/
        '';

        kernelPatches = [
          {
            name = "enable morello";
            #ARM64_MORELLO y
            #EXTRA_FIRMWARE "${extraFetch}/firmware/rtl8168g-2.fw"
            #EXTRA_FIRMWARE_DIR "${extraFetch}/firmware"
            patch = null;
            extraConfig = ''
              SYSVIPC y
              POSIX_MQUEUE y
              AUDIT y
              NO_HZ_IDLE y
              HIGH_RES_TIMERS y
              BPF_SYSCALL y
              PREEMPT y
              IRQ_TIME_ACCOUNTING y
              BSD_PROCESS_ACCT y
              BSD_PROCESS_ACCT_V3 y
              TASKSTATS y
              TASK_DELAY_ACCT y
              TASK_XACCT y
              TASK_IO_ACCOUNTING y
              IKCONFIG y
              IKCONFIG_PROC y
              UCLAMP_TASK y
              NUMA_BALANCING y
              MEMCG y
              BLK_CGROUP y
              UCLAMP_TASK_GROUP y
              CGROUP_PIDS y
              CGROUP_FREEZER y
              CGROUP_HUGETLB y
              CPUSETS y
              CGROUP_DEVICE y
              CGROUP_CPUACCT y
              CGROUP_PERF y
              CGROUP_BPF y
              USER_NS y
              SCHED_AUTOGROUP y
              BLK_DEV_INITRD y
              KALLSYMS_ALL y
              PROFILING y
              KEXEC y
              CRASH_DUMP y
              ARCH_VEXPRESS y
              ARM64_VA_BITS_48 y
              SCHED_MC y
              NUMA y
              COMPAT n
              RANDOMIZE_BASE y
              WQ_POWER_EFFICIENT_DEFAULT y
              ENERGY_MODEL y
              ARM_PSCI_CPUIDLE y
              CPU_FREQ y
              CPU_FREQ_STAT y
              ACPI y
              ACPI_APEI y
              ACPI_APEI_GHES y
              ACPI_APEI_MEMORY_FAILURE y
              ACPI_APEI_EINJ y
              JUMP_LABEL y
              MODULES y
              MODULE_UNLOAD y
              BINFMT_MISC y
              MEMORY_FAILURE y
              TRANSPARENT_HUGEPAGE y
              CMA y
              ANON_VMA_NAME y
              NET y
              PACKET y
              IP_PNP y
              IP_PNP_DHCP y
              NETFILTER y
              NF_CONNTRACK y
              IP_VS y
              IP_NF_IPTABLES y
              IP_NF_FILTER y
              IP_NF_NAT y
              IP_NF_TARGET_MASQUERADE y
              IP_NF_MANGLE y
              BRIDGE y
              NET_9P y
              NET_9P_VIRTIO y
              PCI y
              PCI_HOST_GENERIC y
              DEVTMPFS y
              DEVTMPFS_MOUNT y
              EFI_CAPSULE_LOADER y
              BLK_DEV_LOOP y
              VIRTIO_BLK y
              BLK_DEV_SD m
              ATA y
              SATA_AHCI y
              MD y
              BLK_DEV_DM y
              NETDEVICES y
              MACVLAN y
              MACVTAP y
              TUN y
              VETH y
              VIRTIO_NET y
              R8169 y
              SMC91X y
              INPUT_MOUSEDEV y
              INPUT_EVDEV y
              LEGACY_PTY_COUNT 16
              SERIAL_AMBA_PL011 y
              SERIAL_AMBA_PL011_CONSOLE y
              HW_RANDOM y
              HW_RANDOM_VIRTIO y
              I2C_CADENCE y
              REGULATOR y
              REGULATOR_FIXED_VOLTAGE y
              DRM y
              DRM_LOAD_EDID_FIRMWARE y
              DRM_I2C_NXP_TDA998X y
              DRM_I2C_NXP_TDA9950 y
              DRM_KOMEDA y
              DRM_PANFROST y
              FB y
              FB_EFI y
              USB_HIDDEV y
              I2C_HID_ACPI y
              USB y
              USB_XHCI_HCD y
              USB_STORAGE y
              MMC y
              MMC_BLOCK_MINORS 32
              MMC_ARMMMCI y
              RTC_CLASS y
              RTC_DRV_EFI y
              VIRTIO_MMIO y
              ARM_SMMU_V3 y
              MEMORY y
              ARM_SPE_PMU y
              ANDROID_BINDER_IPC y
              EXT4_FS y
              EXT4_FS_POSIX_ACL y
              EXT4_FS_SECURITY y
              FANOTIFY y
              FANOTIFY_ACCESS_PERMISSIONS y
              QUOTA y
              AUTOFS_FS y
              OVERLAY_FS y
              VFAT_FS y
              PROC_KCORE y
              TMPFS y
              HUGETLBFS y
              NFS_FS y
              ROOT_NFS y
              9P_FS y
              NLS_CODEPAGE_437 y
              NLS_ISO8859_1 y
              KEYS y
              SECURITY y
              SECURITY_NETWORK y
              SECURITY_SELINUX y
              PRINTK_TIME y
              DEBUG_KERNEL y
              DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT y
              MAGIC_SYSRQ y
              DEBUG_FS y
              CORESIGHT y
              MEMTEST y

              
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
    extraPatches = [ ];
  };
in
# change here to change kernel
buildMorelloKernel morello_1_8_1
