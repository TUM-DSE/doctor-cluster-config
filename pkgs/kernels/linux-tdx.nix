{ buildLinux, fetchFromGitHub, ... }@args:
let
  buildKernel = { owner, repo, rev, sha256, version, modDirVersion, extraPatches ? [ ] }:
    buildLinux
      (args // rec {
        inherit version modDirVersion;

        src = fetchFromGitHub {
          inherit owner repo rev sha256;
        };

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
  pkvm_linux_6_18 = {
    owner = "intel-staging";
    repo = "pKVM-IA";
    # tree/pkvm-v6.18-rc3
    rev = "2b6f1c2c6569b89db925b9eec2568d5bebb6bb0b";
    sha256 = "sha256-j9BUXS9MM56Y1X+3iBYUaRaqGHsblqlG2zXaMvxoq24=";
    version = "6.18";
    modDirVersion = "6.18.0-rc3";
    extraPatches = [
      {
        name = "pkvm-config";
        patch = null;
        extraConfig = ''
          PKVM_INTEL y
        '';
      }
    ];
  };
in
# change here to change kernel
#buildKernel tdx_linux_6_16_5
buildKernel pkvm_linux_6_18
