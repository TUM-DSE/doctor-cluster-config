{ buildLinux, fetchFromGitHub, ... }@args:
let
  buildSNPKernel = { owner, repo, rev, sha256, version, modDirVersion, extraPatches ? [ ] }:
    buildLinux
      (args // rec {
        inherit version modDirVersion;

        src = fetchFromGitHub {
          inherit owner repo rev sha256;
        };

        kernelPatches = [
          {
            name = "amd_sme-config";
            patch = null;
            extraConfig = ''
              AMD_MEM_ENCRYPT y
              CRYPTO_DEV_CCP y
              CRYPTO_DEV_CCP_DD m
              CRYPTO_DEV_SP_PSP y
              KVM_AMD_SEV y
              MEMORY_FAILURE y
              EXPERT y
              VFIO_DEVICE_CDEV y
            '';
          }
        ] ++ extraPatches;
        extraMeta.branch = version;
        ignoreConfigErrors = true;
      } // (args.argsOverride or { }));

  # Official kernel 6.16.11 stable release
  # https://github.com/gregkh/linux/tree/v6.16.11
  snp_6_16 = {
    owner = "gregkh";
    repo = "linux";
    # v6.16.11 tag
    rev = "v6.16.11";
    sha256 = "sha256-i+uXKtExQesZOssWCy9B8skcS+CbO1MoOnhxlUYIP3A=";
    version = "6.16.11";
    modDirVersion = "6.16.11";
    extraPatches = [ ];
  };
in
# Build kernel 6.16 with SNP support
buildSNPKernel snp_6_16
