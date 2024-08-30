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
            extraConfig = ''
              X86_X2APIC y
              X86_MCE y
              INTEL_TDX_HOST y
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
