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
            '';
          }
          {
            name = "bug_func export";
            patch = ./zfs-tdx.patch;
            extraConfig = '''';
          }
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
in
# change here to change kernel
buildKernel tdx_kvm_upstream_next_20240122
