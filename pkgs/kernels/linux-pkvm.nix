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
            # Enable TDX config for development
            name = "tdx-config";
            patch = null;
            extraConfig = ''
              X86_X2APIC y
              X86_MCE y
              KVM y
              KVM_INTEL y
              INTEL_TDX_HOST y
            '';
          }
        ] ++ extraPatches;
        extraMeta.branch = version;
        ignoreConfigErrors = true;
        extraMakeFlags = [ "LOCALVERSION=${localVersion}" ];
      } // (args.argsOverride or { }));
  pkvm_linux_6_18 = rec {
    owner = "intel-staging";
    repo = "pKVM-IA";
    # tree/pkvm-pvvmcs-v6.18-wip
    rev = "67c8eba8ccd9613c8da0bc6f9468cf7eb0d9620a";
    sha256 = "sha256-0gqXGh7CgWV7zVTrhrf5y0K8NyJsjMaL0oLXy0muLiE=";
    version = "6.18";
    localVersion = "-pkvm-pvvmcs-v6.18-wip";
    modDirVersion = "6.18.0${localVersion}";
    extraPatches = [
      {
        name = "pkvm-constants-fix";
        patch = ./pkvm-constants-fix-pvvmcs-v6.18-wip.patch;
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
buildKernel pkvm_linux_6_18
