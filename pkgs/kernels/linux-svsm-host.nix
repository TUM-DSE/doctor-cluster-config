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
  coconut_svsm_with_reflectvc = {
    owner = "Sabanic-P";
    repo = "linux";
    rev = "8f3e2540e2131e0559ef2b008387cc715ed9d505"; # branch svsm
    sha256 = "sha256-ry47acIdc6TIDYkaSIQRMzjAjeUef3A6pJO1osxX2W4=";
    version = "6.5-reflectvc";
    modDirVersionArg = "6.5.0";
    extraPatches = [ ];
  };

  # snp_kernel = svsm_preview_hv_1;
  snp_kernel = coconut_svsm_with_reflectvc;

in
with snp_kernel;
buildLinux (args // rec {
  inherit version;
  modDirVersion =
    if (snp_kernel.modDirVersionArg == null) then
      builtins.replaceStrings [ "-" ] [ ".0-" ] version
    else
      modDirVersionArg;
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
        CRYPTO_DEV_CCP_DD y
        CRYPTO_DEV_SP_PSP y
        KVM_AMD_SEV y
        MEMORY_FAILURE y
        EXPERT y
      '';
    }
  ] ++ extraPatches;
  extraMeta.branch = version;
  ignoreConfigErrors = true;
} // (args.argsOverride or { }))
