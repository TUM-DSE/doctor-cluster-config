{ buildLinux, fetchFromGitHub, ... }@args:
let

  svsm_preview_hv_1 = {
    owner = "AMDESE";
    repo = "linux";
    rev = "e69def60bfa53acef2a5ebd8c85d8d544eb2cbbe"; # branch svsm-preview-hv
    sha256 = "sha256-DT3Ych/3BoeqxYFn2F8PajmmPufrN619zZa6X5WUHvo=";
    version = "5.14";
    modDirVersionArg = "5.14.0-rc2";
    extraPatches = [
      {
        # for some reaon, the BTF build fails for 5.14 svsm kernel
        # so just disable it
        name = "disable BTF";
        patch = null;
        extraConfig = ''
          DEBUG_INFO_BTF n
        '';
      }
    ];
  };

  svsm_preview_hv_2 = {
    owner = "AMDESE";
    repo = "linux";
    rev = "4c33a31c6e1524f1b90834aaaea250a085f72dac"; # branch svsm-preview-hv-2
    sha256 = "sha256-eNSQ1monsTvZuI0NnJQx9rqUD8zc3puCqtCS5eYDon0=";
    version = "6.1";
    modDirVersionArg = "6.1.0-rc4";
    extraPatches = [ ];
  };
  coconut_svsm = {
    owner = "Sabanic-P";
    repo = "linux";
    rev = "aa599c0fdf6fbdaeaf12a626155a9eef5ad6f133"; # branch svsm
    sha256 = "sha256-1iN7DENoY1e2cMgP3j9QtXNIrJU/aOYMzRkNsjNONp0=";
    version = "6.5";
    modDirVersionArg = "6.5.0";
    extraPatches = [ ];
  };
  coconut_svsm_with_restricted_interrupt = {
    # untested
    owner = "Sabanic-P";
    repo = "linux";
    rev = "8f3e2540e2131e0559ef2b008387cc715ed9d505"; # branch restricted_injection
    sha256 = "sha256-ry47acIdc6TIDYkaSIQRMzjAjeUef3A6pJO1osxX2W4=";
    version = "6.5-reflectvc";
    modDirVersionArg = "6.5.0";
    extraPatches = [ ];
  };

  coconut_svsm_6_8 = {
    owner = "Sabanic-P";
    repo = "linux";
    rev = "bc4de28e0cc1e7cf404af311c4052560aba355ba"; # branch svsm
    sha256 = "sha256-osvxsBiRPCzJzED2aiY20DQ06gpbEler3WdD9Y+SiXs=";
    version = "6.8";
    modDirVersionArg = "6.8.0";
    extraPatches = [ ];
  };

  coconut_svsm_with_reflectvc_vmpl = {
    owner = "Sabanic-P";
    repo = "linux";
    rev = "29df906740fa864f8ebdcd62c30a20d2a62ec229"; # branch vc_reflection
    sha256 = "sha256-2OM8lDn5WRviHGJhn9jjRo16kyg49lf+WATbSuI6bFI=";
    version = "6.8-vcreflection";
    modDirVersionArg = "6.8.0";
    extraPatches = [ ];
  };

  coconut_svsm_6_11 = {
    owner = "coconut-svsm";
    repo = "linux";
    rev = "3b04c21f46a75560b83bf07eb233f1b414a65324"; # branch svsm
    sha256 = "sha256-nr/DfNX+u0KosVcE6sTbAHeD/hOP4jQpuTjdfUSFFOg=";
    version = "6.11";
    modDirVersionArg = "6.11.0";
    extraPatches = [ ];
  };

  coconut_svsm_6_11_latest = {
    owner = "coconut-svsm";
    repo = "linux";
    rev = "3d7f4e43fb9b1b41f1f0ef09c8f6d770505e59ce"; # branch svsm
    sha256 = "sha256-GCwpZswt8AH6vG28d812CvCC2cVZqIKj0Y+KgVq7pOI=";
    version = "6.11";
    modDirVersionArg = "6.11.0";
    extraPatches = [ ];
  };
  coconut_svsm_6_11_latest_vc = {
    owner = "sabtf";
    repo = "linux";
    rev = "4fdd6b98e4ff627b80460a0a6fe96c902c46d015"; # branch svsm
    sha256 = "sha256-QYkL8AfG8f0uLfNB8NcpJvPKRCGetivWHGFVehf0XWI=";
    version = "6.11-vc";
    localVersion="-svsm-vc-wip";
    modDirVersionArg = "6.11.0-svsm-vc-wip";
    extraPatches = [ ];
  };

  # snp_kernel = svsm_preview_hv_1;
  snp_kernel = coconut_svsm_6_11_latest_vc;
in
with snp_kernel;
buildLinux (
  args
  // rec {
    inherit version;
    modDirVersion =
      if (snp_kernel.modDirVersionArg == null) then
        builtins.replaceStrings [ "-" ] [ ".0-" ] version
      else
        modDirVersionArg;
    src = fetchFromGitHub {
      inherit
        owner
        repo
        rev
        sha256
        ;
    };

    kernelPatches = [
      {
        name = "amd_sme-config";
        patch = null;
        extraConfig = ''
          AMD_MEM_ENCRYPT y
          CRYPTO_DEV_CCP y
          CRYPTO_DEV_CCP_DD y
          CRYPTO_DEV_SP_PSP y
          KVM_AMD_SEV y
          MEMORY_FAILURE y
          EXPERT y
          VFIO_DEVICE_CDEV y
        '';
      }
    ]
    ++ extraPatches;
    extraMeta.branch = version;
    ignoreConfigErrors = true;
    extraMakeFlags = [ "LOCALVERSION=${localVersion}" ];
  }
  // (args.argsOverride or { })
)
