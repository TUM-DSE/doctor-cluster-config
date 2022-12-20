{ buildLinux, fetchFromGitHub, linuxPackages_5_15, fetchurl, modDirVersionArg ? null, ... }@args:

buildLinux (args // rec {
  version = "5.15";
  modDirVersion = if (modDirVersionArg == null) then
    builtins.replaceStrings [ "-" ] [ ".0-" ] version
      else
    modDirVersionArg;
  src = fetchFromGitHub {
    owner = "vmuxIO";
    repo = "linux";
    rev = "4442a5e9a8f2f31646011c75dfcbe74cc699092f"; # branch ioregion-5.15
    sha256 = "sha256-PfjtFwvVMBks+5JWwsIX5jqhWgso13rscAqQ1C1ONfg=";
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
