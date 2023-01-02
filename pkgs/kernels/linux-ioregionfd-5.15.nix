{ buildLinux, fetchFromGitHub, ... }@args:

buildLinux (args // rec {
  version = "5.15";
  modDirVersion = "5.15.84";
  src = fetchFromGitHub {
    owner = "gierens";
    repo = "linux";
    rev = "669ce309ca5572e66ab5a2df30207c7a48cc75f3"; # branch v5.15.84-ioregionfd
    sha256 = "sha256-HrfndxdkIto6NrYKcX0oI4XQvHO5axsrWrV15UYm2ho=";
  };

  kernelPatches = [{
    name = "enable-kvm-ioregion";
    patch = null;
    extraConfig = ''
      KVM_IOREGION y
    '';
  }]; # ++ linuxPackages_5_15.kernel.kernelPatches;
  extraMeta.branch = "5.15";
  ignoreConfigErrors = true;
} // (args.argsOverride or { }))
