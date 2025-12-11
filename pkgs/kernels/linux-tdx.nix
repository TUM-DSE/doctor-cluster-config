{ buildLinux, fetchFromGitHub, ... }@args:
let
  buildKernel = { owner, repo, rev, sha256, version, modDirVersion,
                  url ? "", ref ? "", localVersion ? "", extraPatches ? [ ] }:
    buildLinux
      (args // rec {
        inherit version modDirVersion;

        src = if url != "" then
          if ref != "" then
            builtins.fetchGit { inherit url ref; }
          else
            builtins.fetchGit { inherit url rev; }
        else
          fetchFromGitHub { inherit owner repo rev sha256; };

        kernelPatches = [
          {
            name = "tdx-config";
            patch = null;
            # XXX: The current version of TDX kernel does not support KEXEC
            #      therefore, disable KEXEC, KEXEC_FILE, and CRASH_CUMP that
            #      enable KEXEC_CORE (required by INTEL_TDX_HOST)
            #      future versions will support it
            extraConfig = ''
              X86_X2APIC y
              X86_MCE y
              KVM y
              KVM_INTEL y
              KEXEC n
              KEXEC_CORE n
              KEXEC_FILE n
              CRASH_DUMP n
              INTEL_TDX_HOST y
              KVM_MMU_PRIVATE y
              DRM_AMDGPU n
              IIO n
            '';
          }
          # NOTE: only needed prior to 6.9
          # {
          #   name = "bug_func export";
          #   patch = ./zfs-tdx.patch;
          #   extraConfig = '''';
          # }
        ] ++ extraPatches;
        extraMeta.branch = version;
        ignoreConfigErrors = true;
        extraMakeFlags = [ "LOCALVERSION=${localVersion}" ];
      } // (args.argsOverride or { }));

  tdx_kvm_upstream_next_20240122 = {
    owner = "mmisono";
    repo = "linux";
    # branch: tdx-kvm-upstream-next-20240122
    rev = "cd5f3a9ef935bc249a18a3c6607ae2128c1ced06";
    sha256 = "sha256-jRcxmNV5wOeu5SpQ5LMkBKYQf7wZoikVU3g0l5mPRFc=";
    version = "6.8";
    modDirVersion = "6.8.0-rc1";
  };
  tdx_canonical_6_11_0_1006_6 = {
    owner = "gierens";
    repo = "linux-tdx-canonical";
    # branch: main
    rev = "414aea81b805c91b61a65652605a8b4360eb22a1";
    sha256 = "sha256-xmUGhyhfLEvaGC7LtogVXcpSK2VL0jYlj1kvW2lyHQU=";
    version = "6.11";
    modDirVersion = "6.11.0";
  };
  tdx_mushroom = {
    owner = "Freax13";
    repo = "linux";
    # branch: mushroom-tdx
    rev = "d913eb6d3612397a8c3e302a3fe6176f4f3c58bc";
    sha256 = "sha256-wsw/IA2Si+8ZgHDzZkM6xKb35Ub3OOgerfbaDPN5IZg=";
    version = "6.8";
    modDirVersion = "6.8.0-rc5";
  };
  tdx_linux_6_16_5 = {
    owner = "gregkh";
    repo = "linux";
    # tag: v6.16.5
    rev = "4645fefac0b24d509b962c096b0327e87f34b1d2";
    sha256 = "sha256-XiTuH40b3VJqzwygZzU0FcvMDj41Rq6IsMbm+3+QxDY=";
    version = "6.16.5";
    modDirVersion = "6.16.5";
  };
  pkvm_linux_6_15 = rec {
    owner = "intel-staging";
    repo = "pKVM-IA";
    # tree/pkvm-v6.15-wip
    rev = "d38618ae4ddd69f17cb6ad3beff35e8c82f3bba6";
    sha256 = "sha256-TrD5ZvwThg7M8VbJhgKWVu2VLpvcnFUN4/UQNHjXB1o=";
    version = "6.15";
    localVersion = "-pkvm-v6.15-wip";
    modDirVersion = "6.15.0${localVersion}";
    extraPatches = [
      {
        name = "pkvm-constants-fix";
        patch = ./pkvm-constants-fix.patch;
      }
      {
        name = "pkvm-config";
        patch = null;
        extraConfig = ''
          PKVM_INTEL y
          PKVM_INTEL_DEBUG y
        '';
      }
    ];
  };
  pkvm_linux_6_15_pvvmcs = rec {
    owner = "intel-staging";
    repo = "pKVM-IA";
    # cxdong/pub-pKVM-IAtree pkvm-v6.15-pvvmcs-part1
    rev = "44f43937f7254efd9e9ceba3d557721525bf46eb";
    sha256 = "sha256-wgsciEfFA0IlzoVeW1tGRER0euZHrrLpKICK27/CLx8=";
    version = "6.15";
    localVersion = "-pkvm-v6.15-pvvmcs";
    modDirVersion = "6.15.0${localVersion}";
    extraPatches = [
      {
        name = "pkvm-constants-fix";
        patch = ./pkvm-constants-fix2.patch;
      }
      {
        name = "pkvm-config";
        patch = null;
        extraConfig = ''
          PKVM_INTEL y
          PKVM_INTEL_DEBUG y
        '';
      }
    ];
  };
  pkvm_linux_6_18 = rec {
    owner = "intel-staging";
    repo = "pKVM-IA";
    # tree/pkvm-v6.18
    # rev = "e46b421302af9eca8baf6d1812a690e81adf2ecb";
    # sha256 = "sha256-0Wd9DyhLzGUM1ZcPCGQODlpvI1gpvRI8/JnVsvw4/nY=";
    # cxdong/pub-pKVM-IA/tree/pkvm-v6.18-pvvmcs-part2
    rev = "b5046412770f32fe32c68f2d9683663770cf2b96";
    sha256 = "sha256-lJGKs7JxJWOLdafZq5S94/14JFYtMU0SINfVzCEGiAw=";
    # tree/pkvm-v6.18-rc3
    # rev = "2b6f1c2c6569b89db925b9eec2568d5bebb6bb0b";
    # sha256 = "sha256-j9BUXS9MM56Y1X+3iBYUaRaqGHsblqlG2zXaMvxoq24=";
    version = "6.18";
    localVersion = "-pkvm-v6.18";
    modDirVersion = "6.18.0${localVersion}";
    extraPatches = [
      {
        name = "pkvm-constants-fix";
        #patch = ./pkvm-constants-fix-v6.18.patch;
        patch = ./pkvm-constants-fix-v6.18-pvvmcs-part2.patch;
      }
      {
        name = "pkvm-config";
        patch = null;
        extraConfig = ''
          PKVM_INTEL y
          PKVM_INTEL_DEBUG y
        '';
      }
    ];
  };
in
# change here to change kernel
#buildKernel tdx_linux_6_16_5
buildKernel pkvm_linux_6_18
