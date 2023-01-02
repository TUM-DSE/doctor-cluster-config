{ buildLinux, fetchFromGitHub, modDirVersionArg ? null, ... }@args:

buildLinux (args // rec {
  version = "5.19";
  modDirVersion =
    if (modDirVersionArg == null) then
      builtins.replaceStrings [ "-" ] [ ".0-" ] version
    else
      modDirVersionArg;
  src = fetchFromGitHub {
    owner = "Mic92";
    repo = "linux";
    rev = "6327be32a74aed0139a1895329ce4fea2ec65745"; # branch ioregion-5.19
    sha256 = "";
  };

  kernelPatches = [{
    name = "enable-kvm-ioregion";
    patch = null;
    extraConfig = ''
      KVM_IOREGION y
    '';
  }]; # ++ linuxPackages_5_19.kernel.kernelPatches;
  extraMeta.branch = "5.19";
  ignoreConfigErrors = true;
} // (args.argsOverride or { }))
